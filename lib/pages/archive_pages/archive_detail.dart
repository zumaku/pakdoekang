import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/cards/activity_card.dart';
import 'package:pakdoekang/widgets/cards/daily_spend_card.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ArchiveDetail extends StatefulWidget {
  final int selectedMonth;

  const ArchiveDetail({super.key, required this.selectedMonth});

  @override
  State<ArchiveDetail> createState() => ArchiveDetailState();
}

class ArchiveDetailState extends State<ArchiveDetail> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(DateTime.now().year, widget.selectedMonth, 1);
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateActive =
        DateTime(DateTime.now().year, widget.selectedMonth, 1);

    int getDaysInMonth() {
      var nextMonth = DateTime(dateActive.year, dateActive.month + 1, 1);
      var lastDayOfMonth = nextMonth.subtract(Duration(days: 1));
      return lastDayOfMonth.day;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          SafeArea(
            minimum: EdgeInsets.all(8),
            child: SizedBox(
              height: 90,
              child: DatePicker(
                dateActive,
                initialSelectedDate: _selectedDate,
                daysCount: getDaysInMonth(),
                selectionColor: MyColor.brand,
                deactivatedColor: MyColor.base1,
                selectedTextColor: MyColor.base5,
                dateTextStyle: MyText.getHeadingFiveStyle(),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = date;
                  });
                },
                locale: "id_ID",
              ),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DailySpendCard(today: _selectedDate),
                SizedBox(height: 26),
                MyText.headingSix("Aktifitas", textAlign: TextAlign.start),
                SizedBox(height: 13),

                // Use dataActivity to display activities for the selected date
                StreamBuilder<List<Transaksi>>(
                    stream: Provider.of<FirestoreServiceProvider>(context)
                        .getTransaksi(_selectedDate),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                        return Container(
                          height: MediaQuery.of(context).size.height / 2 - 20,
                          child: Center(
                            child: MyText.labelOne("Error: ${snapshot.error}",
                                color: MyColor.base),
                          ),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 3 - 40,
                          child: Center(
                            child: MyText.labelOne("Tidak ada transaksi",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
