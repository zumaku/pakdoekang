import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_colors.dart';
import 'package:pakdoekang/widgets/my_shadow.dart';
import 'package:pakdoekang/widgets/my_text.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SafeArea(
      minimum: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: MyColor.brand2,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [MyShadow.shadowOne()],
            ),
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
                SizedBox(height: 40),
                MyText.subTitleTwo("Pemasukan: Rp. 50.000")
              ],
            ),
          ),
          Text('Halaman Hari Ini')
        ],
      ),
    ));
  }
}
