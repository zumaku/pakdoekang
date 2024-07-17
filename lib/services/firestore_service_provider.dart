import 'package:flutter/material.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:provider/provider.dart';

class FirestoreServiceProvider with ChangeNotifier {
  late FirestoreService _firestoreService;

  FirestoreServiceProvider(BuildContext context) {
    _firestoreService = FirestoreService(context);
  }

  Stream<List<Transaksi>> get allTransaksi =>
      _firestoreService.getAllTransaksi();

  Stream<List<Transaksi>> searchTransaksi(String searchKeyword) {
    return _firestoreService.searchTransaksi(searchKeyword);
  }

  Stream<List<Map<String, dynamic>>> getMonthlySpendEarn() {
    return _firestoreService.getMonthlySpendEarn();
  }

  Stream<List<Transaksi>> getTransaksi(DateTime date) {
    return _firestoreService.getTransaksi(date);
  }

  Stream<List<Map<String, dynamic>>> get getSummarizeMonths {
    return _firestoreService.getSummarizeMonths();
  }

  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    await _firestoreService.addTransaksi(
        aktifitas, jumlah, isPengeluaran, tanggal, kategori, catatan);
    notifyListeners();
  }

  Future<void> updateTransaksi(
      String id,
      String aktifitas,
      double jumlah,
      bool isPengeluaran,
      DateTime tanggal,
      List<dynamic> kategori,
      String catatan) async {
    await _firestoreService.updateTransaksi(
        id, aktifitas, jumlah, isPengeluaran, tanggal, kategori, catatan);
    notifyListeners();
  }

  Future<void> deleteTransaksi(String id) async {
    await _firestoreService.deleteTransaksi(id);
    notifyListeners();
  }
}
