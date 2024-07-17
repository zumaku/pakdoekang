import 'package:flutter/material.dart';
import 'package:pakdoekang/services/api_service.dart';
import 'package:pakdoekang/models/transaksiku.dart';

class ApiServiceProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  late Stream<List<Transaksiku>> allTransaksiStream;

  Stream<List<Transaksiku>> get allTransaksi => allTransaksiStream;

  ApiServiceProvider() {
    allTransaksiStream = apiService.getAllTransaksi();
  }

  Stream<List<Transaksiku>> searchTransaksi(String searchKeyword) {
    return apiService.searchTransaksi(searchKeyword);
  }

  Stream<List<Map<String, dynamic>>> getMonthlySpendEarn() {
    return apiService.getMonthlySpendEarn();
  }

  Stream<List<Transaksiku>> getTransaksiByDate(DateTime date) {
    return apiService.getTransaksiByDate(date);
  }

  Stream<List<Map<String, dynamic>>> getSummarizeMonths() {
    return apiService.getSummarizeMonths();
  }

  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    await apiService.addTransaksi(
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
    await apiService.updateTransaksi(
        id, aktifitas, jumlah, isPengeluaran, tanggal, kategori, catatan);
    notifyListeners();
  }

  Future<void> deleteTransaksi(String id) async {
    await apiService.deleteTransaksi(id);
    notifyListeners();
  }
}
