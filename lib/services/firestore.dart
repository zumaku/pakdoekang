import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a reference to the transactions collection
  CollectionReference get transactions => _db.collection('transaksi');

  // Function to add a new transaction with categories as an array
  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<String> kategori, String catatan) async {
    try {
      await transactions.add({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': tanggal,
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

  // Function to update a transaction
  Future<void> updateTransaksi(
      String id,
      String aktifitas,
      double jumlah,
      bool isPengeluaran,
      DateTime tanggal,
      List<String> kategori,
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
  final List<String> kategori;
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
      kategori: List<String>.from(data['kategori'] ?? []),
      catatan: data['catatan'] ?? '',
    );
  }
}