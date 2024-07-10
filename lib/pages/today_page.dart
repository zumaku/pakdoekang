import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/cards/daily_spend_card.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SafeArea(
      minimum: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DailySpendCard(),
        ],
      ),
    ));
  }
}
