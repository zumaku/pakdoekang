import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:pakdoekang/services/firestore.dart';

class DailySpendCard extends StatefulWidget {
  const DailySpendCard({super.key});

  @override
  _DailySpendCardState createState() => _DailySpendCardState();
}

class _DailySpendCardState extends State<DailySpendCard> {
  double totalPengeluaran = 0.0;
  double totalPemasukan = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    FirestoreService firestoreService = FirestoreService();
    List<Transaksi> transactions =
        await firestoreService.getTransaksi(DateTime.now());

    double pengeluaran = 0.0;
    double pemasukan = 0.0;

    for (Transaksi transaction in transactions) {
      if (transaction.isPengeluaran) {
        pengeluaran += transaction.jumlah;
      } else {
        pemasukan += transaction.jumlah;
      }
    }

    setState(() {
      totalPengeluaran = pengeluaran;
      totalPemasukan = pemasukan;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    String formattedDay = DateFormat('d').format(DateTime.now());
    String formattedMonth = DateFormat('MMM').format(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: MyColor.brand2,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyShadow.shadowOne()],
      ),
      child: Stack(
        children: <Widget>[
          // Positioned widget for overlay
          Positioned(
            top: -40,
            right: 0,
            child: MyText.headingOne("$formattedDay", color: MyColor.brand1),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: MyText.headingOne("$formattedMonth", color: MyColor.brand1),
          ),

          // Background widget
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.headingFour("Total Pengeluaran",
                        color: MyColor.brand4),
                    MyText.headingFive(
                        "${CurrencyFormat.convertToIdr(totalPengeluaran, 0)}"),
                  ],
                ),
                SizedBox(height: 20),
                MyText.subTitleTwo(
                    "Pemasukan: ${CurrencyFormat.convertToIdr(totalPemasukan, 0)}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
