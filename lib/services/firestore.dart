import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference get transactions => _db.collection('transaksi');

  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    try {
      await transactions.add({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': Timestamp.fromDate(tanggal),
        'kategori': kategori,
        'catatan': catatan,
      });
    } catch (e) {
      print('Error adding transaksi: $e');
      throw Exception('Failed to add transaksi');
    }
  }

  Stream<List<Transaksi>> getAllTransaksi() {
    return transactions.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Transaksi.fromFirestore(doc)).toList());
  }

  Stream<List<Transaksi>> searchTransaksi(String searchKeyword) {
    return transactions.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Transaksi.fromFirestore(doc))
          .where((transaksi) => transaksi.aktifitas
              .toLowerCase()
              .contains(searchKeyword.toLowerCase()))
          .toList();
    });
  }

  Stream<List<Transaksi>> getTransaksi(DateTime date) {
    return transactions.snapshots().map((snapshot) {
      List<Transaksi> filteredTransactions = snapshot.docs
          .map((doc) => Transaksi.fromFirestore(doc))
          .where((transaction) => _isSameDay(transaction.tanggal, date))
          .toList();

      filteredTransactions.sort((a, b) => b.tanggal.compareTo(a.tanggal));

      return filteredTransactions;
    });
  }

  Stream<List<Transaksi>> searchTransactionsByActivity(String activityName) {
    return transactions
        .where('aktifitas', isEqualTo: activityName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Transaksi.fromFirestore(doc)).toList());
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Stream<List<Map<String, dynamic>>> getSummarizeMonths() async* {
    Map<String, Map<String, dynamic>> monthlySummary = {};

    var snapshot = await transactions.get();

    for (var doc in snapshot.docs) {
      var transaksi = Transaksi.fromFirestore(doc);
      String monthKey = DateFormat('yyyy-MM').format(transaksi.tanggal);

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

      if (transaksi.isPengeluaran) {
        monthlySummary[monthKey]!['totalPengeluaran'] += transaksi.jumlah;
      } else {
        monthlySummary[monthKey]!['totalPemasukan'] += transaksi.jumlah;
      }

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
        'datetime': value['datetime'],
        'totalPengeluaran': value['totalPengeluaran'],
        'totalPemasukan': value['totalPemasukan'],
        'topCategories': topCategories,
      });
    });

    summaries.sort((a, b) => b['datetime'].compareTo(a['datetime']));

    yield summaries;
  }

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
