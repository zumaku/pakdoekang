import 'package:flutter/material.dart';
import 'package:pakdoekang/services/firestore.dart';

class FirestoreServiceProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Stream<List<Transaksi>> get allTransaksi => _firestoreService.getAllTransaksi();

  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    await _firestoreService.addTransaksi(aktifitas, jumlah, isPengeluaran, tanggal, kategori, catatan);
    notifyListeners();
  }

  Stream<List<Transaksi>> getTransaksi(DateTime date) {
    return _firestoreService.getTransaksi(date);
  }

  Future<void> updateTransaksi(String id, String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    await _firestoreService.updateTransaksi(id, aktifitas, jumlah, isPengeluaran, tanggal, kategori, catatan);
    notifyListeners();
  }

  Future<void> deleteTransaksi(String id) async {
    await _firestoreService.deleteTransaksi(id);
    notifyListeners();
  }
}
