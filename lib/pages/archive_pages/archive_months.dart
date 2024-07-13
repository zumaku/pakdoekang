import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/dummy_data/dummy_provider.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:provider/provider.dart';
import '../../widgets/styles/my_text.dart';

class ArchiveMonthsPage extends StatelessWidget {
  final bool isArchiveMonts;
  final Function(bool, int) onItemTapped;

  ArchiveMonthsPage({
    required this.isArchiveMonts,
    required this.onItemTapped,
  });
  // const ArchiveMonths({super.key});

  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<DummyProvider>(context);
    final summaries = transaksiProvider.getSummarizeMonths();

    return SingleChildScrollView(
      child: SafeArea(
          minimum: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: summaries.map((data) {
              return GestureDetector(
                onTap: () {
                  // onItemTapped(false, DateTime.june); // di sini nanti passing nama bulannya
                  onItemTapped(false,
                      int.parse(DateFormat('M').format(data['datetime'])));
                  // print(DateFormat('M').format(data['datetime']));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
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
                            color: MyColor.brand1),
                      ),
                      Positioned(
                        top: 40,
                        right: 0,
                        child: MyText.headingOne(
                            DateFormat('yyyy').format(data['datetime']),
                            color: MyColor.brand1),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.headingFour(
                                DateFormat('MMMM-yyyy')
                                    .format(data['datetime']),
                                color: MyColor.brand4),
                            SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  // textDirection: TextDirection.rtl,
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
                                          child: getCategoryIcon(
                                              "${data['topCategories'].length - 1}"),
                                        );
                                      } else if (idx < 3) {
                                        return Positioned(
                                          right: idx * 23.0,
                                          child: getCategoryIcon(category),
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
          )),
    );
  }

  static Widget getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'makan':
        return MyCategoryIcon.makan(borderColor: MyColor.brand4);
      case 'kuliah':
        return MyCategoryIcon.kuliah(borderColor: MyColor.brand4);
      case 'hiburan':
        return MyCategoryIcon.hiburan(borderColor: MyColor.brand4);
      case 'utang':
        return MyCategoryIcon.utang(borderColor: MyColor.brand4);
      case 'belanja':
        return MyCategoryIcon.belanja(borderColor: MyColor.brand4);
      case 'tabungan':
        return MyCategoryIcon.tabungan(borderColor: MyColor.brand4);
      case 'iuran':
        return MyCategoryIcon.iuran(borderColor: MyColor.brand4);
      case 'gajian':
        return MyCategoryIcon.gajian(borderColor: MyColor.brand4);
      case 'hadiah':
        return MyCategoryIcon.hadiah(borderColor: MyColor.brand4);
      default:
        return Container(
          width: 32,
          height: 32,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              border: Border.all(
                color: MyColor.base,
                width: 1.5,
              )),
          child: MyText.buttonThree("${category}+"),
        );
    }
  }
}
