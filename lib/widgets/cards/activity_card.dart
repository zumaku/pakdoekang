// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pakdoekang/services/currency_format.dart';
import 'package:pakdoekang/services/date_converter.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class ActivityCard extends StatelessWidget {
  final String activity;
  final double amount;
  final String category;
  final DateTime date;
  final bool isSpend;

  ActivityCard({
    super.key,
    required this.activity,
    required this.amount,
    required this.category,
    required this.date,
    required this.isSpend,
  });

  @override
  Widget build(BuildContext context) {
    // Logic perubahan text card
    String displayText =
        activity.length > 30 ? "${activity.substring(0, 30)}..." : activity;

    return GestureDetector(
        onTap: () {
          print('Container clicked!');
          // Perform your action here
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
                      getIcon(category)
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
                      isSpend ? MyIcon.arrowUp_bold() : MyIcon.arrowDownBold(),
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

  static Widget getIcon(String category) {
    switch (category.toLowerCase()) {
      case 'makan':
        return MyCategoryIcon.makan();
      case 'kuliah':
        return MyCategoryIcon.kuliah();
      case 'hiburan':
        return MyCategoryIcon.hiburan();
      case 'utang':
        return MyCategoryIcon.utang();
      case 'belanja':
        return MyCategoryIcon.belanja();
      case 'tabungan':
        return MyCategoryIcon.tabungan();
      case 'iuran':
        return MyCategoryIcon.iuran();
      case 'gajian':
        return MyCategoryIcon.gajian();
      case 'hadiah':
        return MyCategoryIcon.hadiah();
      default:
        return MyCategoryIcon
            .makan(); // fallback icon if category is not recognized
    }
  }
}
