import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/buttons/reguler_btn.dart';
import 'package:pakdoekang/widgets/my_icon.dart';

class DetailActivityCard extends StatelessWidget {
  final String activity;
  final double amount;
  final String category;
  final DateTime date;
  final bool isSpend;

  DetailActivityCard({
    super.key,
    required this.activity,
    required this.amount,
    required this.category,
    required this.date,
    required this.isSpend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegulerBtn(
            text: "Tes",
            icon: MyIcon.addTransactionAlt(),
          )
        ],
      ),
    );
  }
}
