import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class DailySpendCard extends StatelessWidget {
  const DailySpendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: MyColor.brand2,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyShadow.shadowOne()],
      ),
      child: Stack(
        children: <Widget>[
          // Positioned widget for overlay
          Positioned(
            top: -40,
            right: 0,
            child: MyText.headingOne("12", color: MyColor.brand1),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: MyText.headingOne("Jul", color: MyColor.brand1),
          ),

          // Background widget
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
                    MyText.headingFive("Rp. 42.000")
                  ],
                ),
                SizedBox(height: 20),
                MyText.subTitleTwo("Pemasukan: Rp. 50.000")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
