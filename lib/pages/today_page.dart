import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/cards/activity_card.dart';
import 'package:pakdoekang/widgets/cards/daily_spend_card.dart';
import 'package:pakdoekang/widgets/cards/detail_activity_card.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:pakdoekang/services/firestore.dart';

class TodayPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DailySpendCard(),
              SizedBox(height: 26),
              MyText.headingSix("Aktifitas", textAlign: TextAlign.start),
              SizedBox(height: 13),
              FutureBuilder<List<Transaksi>>(
                future: _firestoreService.getTransaksi(DateTime.now()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  List<Transaksi>? transaksi = snapshot.data;

                  if (transaksi == null || transaksi.isEmpty) {
                    return Center(child: Text('Tidak ada aktivitas.'));
                  }

                  return Column(
                    children: transaksi.map((transaction) {
                      return ActivityCard(
                        activity: transaction.aktifitas,
                        amount: transaction.jumlah,
                        date: transaction.tanggal,
                        categories: transaction.kategori,
                        isSpend: transaction.isPengeluaran,
                        notes: transaction.catatan,
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
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
