import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:pakdoekang/controllers/date_converter.dart';
import 'package:pakdoekang/widgets/cards/detail_activity_card.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class ActivityCard extends StatelessWidget {
  final String id_activity;
  final String activity;
  final double amount;
  final List<dynamic> categories;
  final DateTime date;
  final bool isSpend;
  final String notes;

  ActivityCard({
    super.key,
    required this.id_activity,
    required this.activity,
    required this.amount,
    required this.categories,
    required this.date,
    required this.isSpend,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    // Logic perubahan text card
    String displayText =
        activity.length > 28 ? "${activity.substring(0, 28)}..." : activity;

    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return DetailActivityCard(
                    id_activity: id_activity,
                    activity: activity,
                    amount: amount,
                    categories: categories,
                    date: date,
                    notes: notes,
                    isSpend: isSpend);
              });
        },
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(12),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.subTitleOne(displayText),
                          MyText.paragraphOne(
                              CurrencyFormat.convertToIdr(amount, 0)),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        fit: StackFit.passthrough,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            width: 56,
                            height: 32,
                            // color: Colors.blue,
                          ),
                          ...categories.asMap().entries.map((entry) {
                            int idx = entry.key;
                            String category = entry.value;

                            if (categories.length > 2 && idx == 0) {
                              // Show special icon if there are more than 3 categories
                              return Positioned(
                                right: idx * 23.0,
                                child:
                                    getCategoryIcon("${categories.length - 1}"),
                              );
                            } else if (idx < 2) {
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
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // MyText.labelTwo("${date.day}-${date.month}-${date.year}",
                      MyText.labelTwo(DateConverter.convert(date),
                          color: MyColor.base4),
                      isSpend ? MyIcon.rupiahUpFill() : MyIcon.rupiahDownFill(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ));
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
