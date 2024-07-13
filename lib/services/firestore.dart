import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a reference to the transactions collection
  CollectionReference get transactions => _db.collection('transaksi');

  // Function to add a new transaction with categories as an array
  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    try {
      await transactions.add({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': Timestamp.fromDate(
            tanggal), // Store DateTime as Firestore Timestamp
        'kategori': kategori,
        'catatan': catatan,
      });
    } catch (e) {
      print('Error adding transaksi: $e');
      throw Exception('Failed to add transaksi');
    }
  }

  // Function to get all transactions
  Stream<List<Transaksi>> getAllTransaksi() {
    return transactions.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Transaksi.fromFirestore(doc)).toList());
  }

  // Function to get transactions for a specific date
  Stream<List<Transaksi>> getTransaksi(DateTime date) {
    return transactions.snapshots().map((snapshot) {
      List<Transaksi> filteredTransactions = snapshot.docs
          .map((doc) => Transaksi.fromFirestore(doc))
          .where((transaction) => _isSameDay(transaction.tanggal, date))
          .toList();

      // Sort transactions based on transaction.tanggal (includes hour & minute)
      filteredTransactions.sort((a, b) => b.tanggal.compareTo(a.tanggal));

      return filteredTransactions;
    });
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Function to summarize transactions by month
  Stream<List<Map<String, dynamic>>> getSummarizeMonths() async* {
    Map<String, Map<String, dynamic>> monthlySummary = {};

    // Fetch all transactions from Firestore
    var snapshot = await transactions.get();

    // Process each transaction
    for (var doc in snapshot.docs) {
      var transaksi = Transaksi.fromFirestore(doc);
      String monthKey = DateFormat('yyyy-MM').format(transaksi.tanggal);

      // Initialize monthly summary if not already created
      if (!monthlySummary.containsKey(monthKey)) {
        DateTime monthStartDate =
            DateTime(transaksi.tanggal.year, transaksi.tanggal.month, 1);
        monthlySummary[monthKey] = {
          'datetime': monthStartDate,
          'totalPengeluaran': 0.0,
          'totalPemasukan': 0.0,
          'categoryCount': <String, int>{}
        };
      }

      // Update totals based on transaction type
      if (transaksi.isPengeluaran) {
        monthlySummary[monthKey]!['totalPengeluaran'] += transaksi.jumlah;
      } else {
        monthlySummary[monthKey]!['totalPemasukan'] += transaksi.jumlah;
      }

      // Update category counts
      for (var category in transaksi.kategori) {
        var categoryCountMap =
            monthlySummary[monthKey]!['categoryCount'] as Map<String, int>;
        categoryCountMap[category] = (categoryCountMap[category] ?? 0) + 1;
      }
    }

    List<Map<String, dynamic>> summaries = [];
    monthlySummary.forEach((key, value) {
      var sortedCategories = (value['categoryCount'] as Map<String, int>)
          .entries
          .toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      var topCategories = sortedCategories.take(3).map((e) => e.key).toList();

      summaries.add({
        'datetime': value['datetime'], // Return DateTime
        'totalPengeluaran': value['totalPengeluaran'],
        'totalPemasukan': value['totalPemasukan'],
        'topCategories': topCategories,
      });
    });

    // Sort summaries by date
    summaries.sort((a, b) => b['datetime'].compareTo(a['datetime']));

    yield summaries;
  }

  // Function to update a transaction
  Future<void> updateTransaksi(
      String id,
      String aktifitas,
      double jumlah,
      bool isPengeluaran,
      DateTime tanggal,
      List<dynamic> kategori,
      String catatan) async {
    try {
      await transactions.doc(id).update({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': tanggal,
        'kategori': kategori,
        'catatan': catatan,
      });
    } catch (e) {
      print('Error updating transaksi: $e');
      throw Exception('Failed to update transaksi');
    }
  }

  // Function to delete a transaction
  Future<void> deleteTransaksi(String id) async {
    try {
      await transactions.doc(id).delete();
    } catch (e) {
      print('Error deleting transaction: $e');
      throw Exception('Failed to delete transaction');
    }
  }
}

class Transaksi {
  final String id;
  final String aktifitas;
  final double jumlah;
  final bool isPengeluaran;
  final DateTime tanggal;
  final List<dynamic> kategori;
  final String catatan;

  Transaksi({
    required this.id,
    required this.aktifitas,
    required this.jumlah,
    required this.isPengeluaran,
    required this.tanggal,
    required this.kategori,
    required this.catatan,
  });

  factory Transaksi.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Transaksi(
      id: doc.id,
      aktifitas: data['aktifitas'] ?? '',
      jumlah: (data['jumlah'] ?? 0.0).toDouble(),
      isPengeluaran: data['isPengeluaran'] ?? false,
      tanggal: (data['tanggal'] as Timestamp).toDate(),
      kategori: data['kategori'] ?? [],
      catatan: data['catatan'] ?? '',
    );
  }
}
