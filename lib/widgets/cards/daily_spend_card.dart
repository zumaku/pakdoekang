import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:pakdoekang/models/transaksiku.dart';
import 'package:pakdoekang/services/api_service_provider.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class DailySpendCard extends StatelessWidget {
  final DateTime today;

  DailySpendCard({
    Key? key,
    DateTime? today,
  })  : today = today ?? DateTime.now(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Transaksiku>>(
      stream:
          Provider.of<ApiServiceProvider>(context).getTransaksiByDate(today),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SkeletonLoader(
            // Customize your skeleton loader here
            builder: Container(
              height: 140,
              decoration: BoxDecoration(
                color: MyColor.brand5,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            items: 1,
            period: Duration(seconds: 1),
          );
        }
        if (snapshot.hasError) {
          return Container(
            height: MediaQuery.of(context).size.height / 2 - 20,
            child: Center(
              child: MyText.labelOne("Error: ${snapshot.error}",
                  color: MyColor.base),
            ),
          );
        }
        // if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //   return Center(child: Text('No transactions found for today.'));
        // }

        List<Transaksiku> transactions = snapshot.data!;
        double totalPengeluaran = 0.0;
        double totalPemasukan = 0.0;

        for (Transaksiku transaction in transactions) {
          if (transaction.isPengeluaran) {
            totalPengeluaran += transaction.jumlah;
          } else {
            totalPemasukan += transaction.jumlah;
          }
        }

        String formattedDay = DateFormat('d').format(today);
        String formattedMonth = DateFormat('MMM').format(today);

        return Container(
          decoration: BoxDecoration(
            color: MyColor.brand2,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [MyShadow.shadowOne()],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -40,
                right: 0,
                child:
                    MyText.headingOne("$formattedDay", color: MyColor.brand1),
              ),
              Positioned(
                top: 40,
                right: 0,
                child:
                    MyText.headingOne("$formattedMonth", color: MyColor.brand1),
              ),
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
      },
    );
  }
}
