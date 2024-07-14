import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/charts/top_category_piechart.dart';

class AnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
