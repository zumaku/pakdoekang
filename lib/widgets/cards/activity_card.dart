import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Logic perubahan text card
    String text = "Beli nasi kuning di warung pak mamat";
    if (text.length > 30) {
      text = "${text.substring(0, 30)}...";
    }

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
                          MyText.subTitleOne(text),
                          MyText.paragraphOne("RP. 12.000"),
                        ],
                      ),
                      MyCategoryIcon.makan()
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.labelTwo("Hari ini", color: MyColor.base4),
                      MyIcon.arrowUp_bold(),
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
}
