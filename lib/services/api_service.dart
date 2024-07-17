import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pakdoekang/models/transaksiku.dart';
import 'package:intl/intl.dart';

class ApiService {
  final String baseUrl =
      'http://localhost:3000/api'; // Ganti dengan URL API Anda

  Stream<List<Transaksiku>> getAllTransaksi() async* {
    while (true) {
      final response = await http.get(Uri.parse('$baseUrl/transaksi'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        yield data.map((item) => Transaksiku.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load transaksi');
      }
      await Future.delayed(Duration(seconds: 5)); // Polling setiap 5 detik
    }
  }

  Stream<List<Transaksiku>> searchTransaksi(String searchKeyword) async* {
    while (true) {
      final response = await http.get(
          Uri.parse('$baseUrl/transaksi/search?searchKeyword=$searchKeyword'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        yield data.map((item) => Transaksiku.fromJson(item)).toList();
      } else {
        throw Exception('Failed to search transaksi');
      }
      await Future.delayed(Duration(seconds: 5)); // Polling setiap 5 detik
    }
  }

  Stream<List<Map<String, dynamic>>> getMonthlySpendEarn() async* {
    final response =
        await http.get(Uri.parse('$baseUrl/transaksi/monthly-spend-earn'));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      yield data;
    } else {
      throw Exception('Failed to load monthly spend and earn data');
    }
  }

  Stream<List<Transaksiku>> getTransaksiByDate(DateTime date) async* {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final response = await http
        .get(Uri.parse('$baseUrl/transaksi/by-date?date=$formattedDate'));
    // .get(Uri.parse('$baseUrl/transaksi/by-date?date=2024-05-03'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      yield data.map((item) => Transaksiku.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load transaksi by date');
    }
  }

  Stream<List<Map<String, dynamic>>> getSummarizeMonths() async* {
    final response =
        await http.get(Uri.parse('$baseUrl/transaksi/summarize-months'));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      // Convert datetime strings to DateTime objects if necessary
      for (var item in data) {
        item['datetime'] = DateTime.parse(item['datetime']);
      }
      yield data;
    } else {
      throw Exception('Failed to load summarize months data');
    }
  }

  Future<void> addTransaksi(String aktifitas, double jumlah, bool isPengeluaran,
      DateTime tanggal, List<dynamic> kategori, String catatan) async {
    final url = Uri.parse('$baseUrl/transaksi');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': DateFormat('yyyy-MM-ddTHH:mm:ss').format(tanggal),
        'kategori': kategori,
        'catatan': catatan,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add transaksi');
    }
  }

  Future<void> updateTransaksi(
      String id,
      String aktifitas,
      double jumlah,
      bool isPengeluaran,
      DateTime tanggal,
      List<dynamic> kategori,
      String catatan) async {
    final url = Uri.parse('$baseUrl/transaksi/$id');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'aktifitas': aktifitas,
        'jumlah': jumlah,
        'isPengeluaran': isPengeluaran,
        'tanggal': DateFormat('yyyy-MM-ddTHH:mm:ss').format(tanggal),
        'kategori': kategori,
        'catatan': catatan,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update transaksi');
    }
  }

  Future<void> deleteTransaksi(String id) async {
    final url = Uri.parse('$baseUrl/transaksi/$id');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete transaksi');
    }
  }
}
