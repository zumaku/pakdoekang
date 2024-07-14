import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../../widgets/styles/my_text.dart';

class ArchiveMonthsPage extends StatelessWidget {
  final bool isArchiveMonts;
  final Function(bool, int) onItemTapped;

  ArchiveMonthsPage({
    required this.isArchiveMonts,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: Provider.of<FirestoreServiceProvider>(context).getSummarizeMonths,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(children: [
            SizedBox(height: 14),
            SkeletonLoader(
              builder: Container(
                height: 140,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColor.brand5,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              items: 1,
              period: Duration(seconds: 1),
            ),
            SizedBox(height: 14),
            SkeletonLoader(
              builder: Container(
                height: 140,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColor.brand5,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              items: 1,
              period: Duration(seconds: 1),
            ),
          ]);
        } else if (snapshot.hasError) {
          return Container(
            height: MediaQuery.of(context).size.height / 2 - 20,
            child: Center(
              child: MyText.labelOne("Error: ${snapshot.error}",
                  color: MyColor.base),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            height: MediaQuery.of(context).size.height / 2 - 20,
            child: Center(
              child: MyText.labelOne("Tidak ada Arsip", color: MyColor.base),
            ),
          );
        }

        final summaries = snapshot.data!;
        return SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: summaries.map((data) {
                return GestureDetector(
                  onTap: () {
                    onItemTapped(false,
                        int.parse(DateFormat('M').format(data['datetime'])));
                  },
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 16),
                    margin: EdgeInsets.fromLTRB(14, 16, 14, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [MyShadow.shadowOne()],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -40,
                          right: 0,
                          child: MyText.headingOne(
                            DateFormat('MMM').format(data['datetime']),
                            color: MyColor.brand1,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 0,
                          child: MyText.headingOne(
                            DateFormat('yyyy').format(data['datetime']),
                            color: MyColor.brand1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.headingFour(
                                DateFormat('MMMM yyyy')
                                    .format(data['datetime']),
                                color: MyColor.brand4,
                              ),
                              SizedBox(height: 35),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText.subTitleTwo(
                                          "Pengeluaran: ${CurrencyFormat.convertToIdr(data['totalPengeluaran'], 0)}"),
                                      MyText.subTitleTwo(
                                          "Pemasukan: ${CurrencyFormat.convertToIdr(data['totalPemasukan'], 0)}"),
                                    ],
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    fit: StackFit.passthrough,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 32,
                                      ),
                                      ...data['topCategories']
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int idx = entry.key;
                                        String category = entry.value;

                                        if (data['topCategories'].length > 3 &&
                                            idx == 0) {
                                          // Show special icon if there are more than 3 categories
                                          return Positioned(
                                            right: idx * 23.0,
                                            child: MyCategoryIcon.getCategoryIcon(
                                                "${data['topCategories'].length - 1}"),
                                          );
                                        } else if (idx < 3) {
                                          return Positioned(
                                            right: idx * 23.0,
                                            child: MyCategoryIcon.getCategoryIcon(category),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }).toList(),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ));
      },
    );
  }
}
