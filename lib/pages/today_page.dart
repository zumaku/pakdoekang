import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/widgets/cards/activity_card.dart';
import 'package:pakdoekang/widgets/cards/daily_spend_card.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
            minimum: EdgeInsets.all(20),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DailySpendCard(),
                  SizedBox(height: 26),
                  MyText.headingSix("Aktifitas", textAlign: TextAlign.start),
                  SizedBox(height: 13),
                  StreamBuilder<List<Transaksi>>(
                      stream: Provider.of<FirestoreServiceProvider>(context)
                          .getTransaksi(DateTime.now()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SkeletonLoader(
                            // Customize your skeleton loader here
                            builder: Container(
                              height: 100,
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                color: MyColor.base5,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            items: 3,
                            period: Duration(seconds: 1),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: MyText.paragraphOne(
                                  'Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 2 - 20,
                            child: Center(
                              child: MyText.labelOne("Belum ada transaksi",
                                  color: MyColor.base),
                            ),
                          );
                        }

                        final transactions = snapshot.data!;
                        return Column(
                          children: transactions.map((transaction) {
                            return ActivityCard(
                              id_activity: transaction.id,
                              activity: transaction.aktifitas,
                              amount: transaction.jumlah,
                              date: transaction.tanggal,
                              categories: transaction.kategori,
                              isSpend: transaction.isPengeluaran,
                              notes: transaction.catatan,
                            );
                          }).toList(),
                        );
                      }),
                ])));
  }

  static Widget addActivity() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add Activity',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Activity Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle the save action here
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
