import 'package:intl/intl.dart';

class Transaksiku {
  final String id;
  final String aktifitas;
  final double jumlah;
  final bool isPengeluaran;
  final DateTime tanggal;
  final List<dynamic> kategori;
  final String catatan;

  Transaksiku({
    required this.id,
    required this.aktifitas,
    required this.jumlah,
    required this.isPengeluaran,
    required this.tanggal,
    required this.kategori,
    required this.catatan,
  });

  factory Transaksiku.fromJson(Map<String, dynamic> json) {
    return Transaksiku(
      id: json['_id'], // Asumsikan MongoDB menggunakan _id sebagai ID dokumen
      aktifitas: json['aktifitas'],
      jumlah: (json['jumlah'] ?? 0.0).toDouble(),
      isPengeluaran: json['isPengeluaran'],
      tanggal: DateTime.parse(json['tanggal']),
      kategori: json['kategori'] ?? [],
      catatan: json['catatan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'aktifitas': aktifitas,
      'jumlah': jumlah,
      'isPengeluaran': isPengeluaran,
      'tanggal': DateFormat('yyyy-MM-ddTHH:mm:ss').format(tanggal),
      'kategori': kategori,
      'catatan': catatan,
    };
  }
}
