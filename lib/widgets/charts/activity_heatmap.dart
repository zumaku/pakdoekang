import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ActivityHeatmap extends StatelessWidget {
  const ActivityHeatmap({Key? key});

  @override
  Widget build(BuildContext context) {
    final transactionStream =
        context.watch<FirestoreServiceProvider>().allTransaksi;

    return StreamBuilder<List<Transaksi>>(
      stream: transactionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
              padding: EdgeInsets.all(10),
              child: SkeletonLoader(
                builder: Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: MyColor.base2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                items: 1,
                period: Duration(seconds: 2),
              ));
        }

        if (snapshot.hasError) {
          return Center(
              child: Container(
                  height: 300,
                  child: MyText.paragraphOne('Error ${snapshot.error}')));
        }

        List<Transaksi> transactions = snapshot.data ?? [];

        // Step 1: Calculate daily transaction counts
        Map<DateTime, int> dailyCounts = {};
        for (var transaksi in transactions) {
          DateTime date = DateTime(transaksi.tanggal.year,
              transaksi.tanggal.month, transaksi.tanggal.day);
          if (!dailyCounts.containsKey(date)) {
            dailyCounts[date] = 0;
          }
          dailyCounts[date] = dailyCounts[date]! + 1;
        }

        // Step 2: Build the `datasets` map
        Map<DateTime, int> datasets = {};
        dailyCounts.forEach((date, count) {
          datasets[date] = count;
        });

        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              MyText.headingSix("Intensitas Harian"),
              SizedBox(height: 10),
              HeatMap(
                datasets: datasets,
                colorMode: ColorMode.color,
                showText: false,
                scrollable: true,
                defaultColor: MyColor.base1,
                colorTipCount: 5,
                size: 30,
                colorsets: const {
                  1: MyColor.brand1,
                  3: MyColor.brand2,
                  5: MyColor.brand3,
                  9: MyColor.brand4,
                  13: MyColor.brand5,
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
