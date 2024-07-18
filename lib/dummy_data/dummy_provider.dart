import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/dummy_data/dummy_model.dart';

class DummyProvider with ChangeNotifier {
  List<DummyTransaction> _transaksiList = [
    // Transaksi Kemarin
    DummyTransaction(
      id: 'awverccaszerwe',
      aktifitas: 'Makan Siang',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
      kategori: ['Makan'],
      catatan: 'Makan siang bersama teman',
    ),
    DummyTransaction(
      id: 'bdfgrtyujhnbvcd',
      aktifitas: 'Belanja Bulanan',
      jumlah: 300000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
      kategori: ['Belanja'],
      catatan: 'Belanja bulanan di supermarket',
    ),
    DummyTransaction(
      id: 'cvbnhgtfdresdwe',
      aktifitas: 'Gajian',
      jumlah: 5000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(hours: 3, minutes: 30)),
      kategori: ['Gajian'],
      catatan: 'Gaji bulan Juli',
    ),
    DummyTransaction(
      id: 'sdfghnmjkiouytr',
      aktifitas: 'Nonton Film',
      jumlah: 80000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 4, minutes: 30)),
      kategori: ['Hiburan'],
      catatan: 'Nonton film di bioskop',
    ),
    DummyTransaction(
      id: 'dfghnbvcxdfrtgh',
      aktifitas: 'Tabungan',
      jumlah: 1000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(hours: 5, minutes: 30)),
      kategori: ['Tabungan'],
      catatan: 'Tabungan bulanan',
    ),
    DummyTransaction(
      id: 'mnbvcxzasdfghj',
      aktifitas: 'Bayar Utang',
      jumlah: 200000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 6, minutes: 30)),
      kategori: ['Utang'],
      catatan: 'Bayar utang ke teman',
    ),
    DummyTransaction(
      id: 'qazwsxedcrfvtgb',
      aktifitas: 'Hadiah Ulang Tahun',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 7, minutes: 30)),
      kategori: ['Hadiah'],
      catatan: 'Beli hadiah ulang tahun untuk teman',
    ),
    DummyTransaction(
      id: 'plokijuhygtfdes',
      aktifitas: 'Iuran RT',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 8, minutes: 30)),
      kategori: ['Iuran'],
      catatan: 'Bayar iuran RT bulanan',
    ),
    DummyTransaction(
      id: 'wqasxedcrfvtgby',
      aktifitas: 'Sarapan',
      jumlah: 20000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 9, minutes: 30)),
      kategori: ['Makan'],
      catatan: 'Sarapan di warung',
    ),
    DummyTransaction(
      id: 'zxcvbnmasdfghjk',
      aktifitas: 'Makan Malam',
      jumlah: 75000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 10, minutes: 30)),
      kategori: ['Makan'],
      catatan: 'Makan malam bersama keluarga',
    ),

    DummyTransaction(
      id: 'addasuxbyygkays',
      aktifitas: 'Belanja Bulanan',
      jumlah: 300000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 2)),
      kategori: ['Belanja'],
      catatan: 'Belanja bulanan di supermarket',
    ),

    // Transaksi Bulan Lalu
    DummyTransaction(
      id: 'awverwe34tbertccaszerwe',
      aktifitas: 'Makan Siang',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Makan'],
      catatan: 'Makan siang bersama teman',
    ),
    DummyTransaction(
      id: 'bdfgrtyujhweb5yetrnbvcd',
      aktifitas: 'Belanja Bulanan',
      jumlah: 300000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 35)),
      kategori: ['Belanja'],
      catatan: 'Belanja bulanan di supermarket',
    ),
    DummyTransaction(
      id: 'cvbnhgtfdrw35t46etesdwe',
      aktifitas: 'Gajian',
      jumlah: 5000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(days: 38)),
      kategori: ['Gajian'],
      catatan: 'Gaji bulan Juli',
    ),
    DummyTransaction(
      id: 'sdfghnmw4tbjkiouytr',
      aktifitas: 'Nonton Film',
      jumlah: 80000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 39)),
      kategori: ['Hiburan'],
      catatan: 'Nonton film di bioskop',
    ),
    DummyTransaction(
      id: 'dfghnbvcxqw3vcdrstdfrtgh',
      aktifitas: 'Tabungan',
      jumlah: 1000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Tabungan'],
      catatan: 'Tabungan bulanan',
    ),
    // Additional dummy transactions
    DummyTransaction(
      id: 'thgwrtse45tyrw',
      aktifitas: 'Beli Buku',
      jumlah: 100000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 11, minutes: 45)),
      kategori: ['Belanja'],
      catatan: 'Beli buku di toko buku',
    ),
    DummyTransaction(
      id: 'bgtresdftywer56',
      aktifitas: 'Bayar Listrik',
      jumlah: 300000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 12, minutes: 15)),
      kategori: ['Iuran'],
      catatan: 'Bayar tagihan listrik bulanan',
    ),
    DummyTransaction(
      id: 'asef45tdvrey56tr',
      aktifitas: 'Jual Barang Bekas',
      jumlah: 200000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(hours: 13, minutes: 20)),
      kategori: ['Gajian'],
      catatan: 'Jual barang bekas di pasar loak',
    ),
    DummyTransaction(
      id: 'hsfbry56y5vdr6yr',
      aktifitas: 'Sumbangan',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 14, minutes: 35)),
      kategori: ['Iuran'],
      catatan: 'Sumbangan untuk panti asuhan',
    ),
    DummyTransaction(
      id: 'rtgvddry56try5',
      aktifitas: 'Beli Peralatan Dapur',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 15, minutes: 50)),
      kategori: ['Belanja'],
      catatan: 'Beli peralatan dapur di supermarket',
    ),
    DummyTransaction(
      id: 'cfvfy55tgh56t4y',
      aktifitas: 'Tarik Tunai',
      jumlah: 1000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(hours: 16, minutes: 10)),
      kategori: ['Gajian'],
      catatan: 'Tarik tunai di ATM',
    ),
    DummyTransaction(
      id: 'dgtrvfg6tgh56y',
      aktifitas: 'Beli Obat',
      jumlah: 75000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 17, minutes: 25)),
      kategori: ['Belanja'],
      catatan: 'Beli obat di apotek',
    ),
    DummyTransaction(
      id: 'yhdty65t4yt5y',
      aktifitas: 'Beli Bensin',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 18, minutes: 45)),
      kategori: ['Belanja'],
      catatan: 'Isi bensin motor',
    ),
    DummyTransaction(
      id: 'qwedfrgt6trr4',
      aktifitas: 'Beli Makanan Ringan',
      jumlah: 30000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 19, minutes: 55)),
      kategori: ['Belanja'],
      catatan: 'Beli makanan ringan di minimarket',
    ),
    DummyTransaction(
      id: 'cbdfgr6t4rt6t',
      aktifitas: 'Beli Pulsa',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(hours: 20, minutes: 30)),
      kategori: ['Belanja'],
      catatan: 'Isi pulsa handphone',
    ),

    DummyTransaction(
      id: 'mnbvcxse4ts4zasdfghj',
      aktifitas: 'Bayar Utang',
      jumlah: 200000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 40)),
      kategori: ['Utang'],
      catatan: 'Bayar utang ke teman',
    ),
    DummyTransaction(
      id: 'qazwsevrtsecrsxedcrfvtgb',
      aktifitas: 'Hadiah Ulang Tahun',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Hadiah'],
      catatan: 'Beli hadiah ulang tahun untuk teman',
    ),
    DummyTransaction(
      id: 'escftr',
      aktifitas: 'Iuran RT',
      jumlah: 50000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Iuran'],
      catatan: 'Bayar iuran RT bulanan',
    ),
    DummyTransaction(
      id: 'wqasxedcres4rwerfvtgby',
      aktifitas: 'Sarapan',
      jumlah: 20000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Makan'],
      catatan: 'Sarapan di warung',
    ),
    DummyTransaction(
      id: 'zxcvbnmasdfghjk',
      aktifitas: 'Makan Malam',
      jumlah: 75000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 34)),
      kategori: ['Makan'],
      catatan: 'Makan malam bersama keluarga',
    ),

    // Transaksi 2 Bulan Lalu
    DummyTransaction(
      id: 'aert2qcxa',
      aktifitas: 'Nonton Bioskop',
      jumlah: 75000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 68)),
      kategori: ['Hiburan'],
      catatan: 'Nonton film terbaru',
    ),

    // Transaksi 3 bulan lalu
    DummyTransaction(
      id: 'esczrzsecxr',
      aktifitas: 'Bayar Utang',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 136)),
      kategori: ['Utang'],
      catatan: 'Bayar utang ke teman',
    ),
    // Additional dummy transactions for different months and times
    DummyTransaction(
      id: 'dfgrty65t6ytv',
      aktifitas: 'Beli Tiket Konser',
      jumlah: 500000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 45, hours: 5)),
      kategori: ['Hiburan'],
      catatan: 'Beli tiket konser idola',
    ),
    DummyTransaction(
      id: 'asef45tgrrt6tr',
      aktifitas: 'Makan Malam',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 60, hours: 6)),
      kategori: ['Makan'],
      catatan: 'Makan malam di restoran favorit',
    ),
    DummyTransaction(
      id: 'gsdhre5t6y',
      aktifitas: 'Belanja Elektronik',
      jumlah: 1000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 90, hours: 7)),
      kategori: ['Belanja'],
      catatan: 'Beli laptop baru',
    ),
    DummyTransaction(
      id: 'bgtresdftr6y6ytwer56',
      aktifitas: 'Bayar Sewa Rumah',
      jumlah: 3000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 120, hours: 8)),
      kategori: ['Iuran'],
      catatan: 'Bayar sewa rumah bulan ini',
    ),
    DummyTransaction(
      id: 'wqasxevcrdctvtrgby',
      aktifitas: 'Gajian',
      jumlah: 8000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(days: 150, hours: 9)),
      kategori: ['Gajian'],
      catatan: 'Gaji bulan ini',
    ),
    DummyTransaction(
      id: 'esfcrtvyr5y56t',
      aktifitas: 'Liburan',
      jumlah: 2000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 180, hours: 10)),
      kategori: ['Hiburan'],
      catatan: 'Liburan akhir tahun',
    ),
    DummyTransaction(
      id: 'qwesrdftrr5t5',
      aktifitas: 'Beli Barang Antik',
      jumlah: 500000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 210, hours: 11)),
      kategori: ['Belanja'],
      catatan: 'Beli barang antik dari luar negeri',
    ),
    DummyTransaction(
      id: 'bgtresdf5t6ytwer56',
      aktifitas: 'Donasi',
      jumlah: 100000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 240, hours: 12)),
      kategori: ['Iuran'],
      catatan: 'Donasi untuk bencana alam',
    ),
    DummyTransaction(
      id: 'asef45tgr5r6tr',
      aktifitas: 'Makan Siang',
      jumlah: 75000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 270, hours: 13)),
      kategori: ['Makan'],
      catatan: 'Makan siang di restoran favorit',
    ),
    DummyTransaction(
      id: 'gsevrtwe56y',
      aktifitas: 'Pembayaran Tagihan',
      jumlah: 250000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 300, hours: 14)),
      kategori: ['Iuran'],
      catatan: 'Bayar tagihan bulanan',
    ),
// Additional dummy transactions for different months and times
    DummyTransaction(
      id: 'bgtrew45y65t6y',
      aktifitas: 'Pembelian Buku',
      jumlah: 150000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 330, hours: 15)),
      kategori: ['Belanja'],
      catatan: 'Beli buku-buku referensi',
    ),
    DummyTransaction(
      id: 'asef45tgrrt6tyw3r56',
      aktifitas: 'Makan Malam',
      jumlah: 200000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 360, hours: 16)),
      kategori: ['Makan'],
      catatan: 'Makan malam di restoran baru',
    ),
    DummyTransaction(
      id: 'bgtresdftr6y6ytwe1r56',
      aktifitas: 'Donasi',
      jumlah: 500000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 390, hours: 17)),
      kategori: ['Iuran'],
      catatan: 'Donasi untuk yayasan sosial',
    ),
    DummyTransaction(
      id: 'wqasxevcrdctv5r6tgby',
      aktifitas: 'Gajian',
      jumlah: 9000000,
      isPengeluaran: false,
      tanggal: DateTime.now().subtract(Duration(days: 420, hours: 18)),
      kategori: ['Gajian'],
      catatan: 'Gaji bulan ini',
    ),
    DummyTransaction(
      id: 'esfcrtvyr5y56t4r',
      aktifitas: 'Pembelian Barang Elektronik',
      jumlah: 3000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 450, hours: 19)),
      kategori: ['Belanja'],
      catatan: 'Beli laptop dan smartphone baru',
    ),
    DummyTransaction(
      id: 'qwesrdftrr5t5wwe',
      aktifitas: 'Liburan',
      jumlah: 4000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 480, hours: 20)),
      kategori: ['Hiburan'],
      catatan: 'Liburan ke luar negeri',
    ),
    DummyTransaction(
      id: 'bgtresdf5t6ytw5e1r56',
      aktifitas: 'Bayar Pajak',
      jumlah: 2000000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 510, hours: 21)),
      kategori: ['Iuran'],
      catatan: 'Bayar pajak tahunan',
    ),
    DummyTransaction(
      id: 'asef45tgr5r6trzwer',
      aktifitas: 'Makan Siang',
      jumlah: 100000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 540, hours: 22)),
      kategori: ['Makan'],
      catatan: 'Makan siang di kantin',
    ),
    DummyTransaction(
      id: 'gsevrtwe56yqwr',
      aktifitas: 'Pembelian Perlengkapan Rumah',
      jumlah: 500000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 570, hours: 23)),
      kategori: ['Belanja'],
      catatan: 'Beli perabotan rumah tangga baru',
    ),
    DummyTransaction(
      id: 'zsevrtwe56y6t1gby',
      aktifitas: 'Pembayaran Listrik',
      jumlah: 300000,
      isPengeluaran: true,
      tanggal: DateTime.now().subtract(Duration(days: 600, hours: 0)),
      kategori: ['Iuran'],
      catatan: 'Bayar tagihan listrik bulan ini',
    ),
  ];

  List<DummyTransaction> get transaksiList => _transaksiList;

  void addTransaksi(DummyTransaction transaksi) {
    _transaksiList.add(transaksi);
    notifyListeners();
  }

  void updateTransaksi(DummyTransaction updatedTransaksi) {
    int index = _transaksiList
        .indexWhere((transaksi) => transaksi.id == updatedTransaksi.id);
    if (index != -1) {
      _transaksiList[index] = updatedTransaksi;
      notifyListeners();
    }
  }

  void deleteTransaksi(String id) {
    _transaksiList.removeWhere((transaksi) => transaksi.id == id);
    notifyListeners();
  }

  List<DummyTransaction> getTransaksi(DateTime today) {
    today = today ?? DateTime.now();
    return _transaksiList
        .where((transaksi) =>
            transaksi.tanggal.year == today.year &&
            transaksi.tanggal.month == today.month &&
            transaksi.tanggal.day == today.day)
        .toList();
  }

  List<Map<String, dynamic>> getSummarizeMonths() {
    Map<String, Map<String, dynamic>> monthlySummary = {};

    for (var transaksi in _transaksiList) {
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

      // Initialize totals
      monthlySummary[monthKey]!['totalPengeluaran'] ??= 0.0;
      monthlySummary[monthKey]!['totalPemasukan'] ??= 0.0;

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

    return summaries;
  }
}
