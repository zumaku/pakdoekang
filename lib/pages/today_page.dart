import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/cards/activity_card.dart';
import 'package:pakdoekang/widgets/cards/daily_spend_card.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class TodayPage extends StatelessWidget {
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
          SizedBox(
            height: 26,
          ),
          MyText.headingSix("Aktifitas"),
          SizedBox(
            height: 13,
          ),

          // List Card
          ActivityCard(),
          ActivityCard(),
          ActivityCard(),
          ActivityCard(),
        ],
      ),
    )));
  }
}
