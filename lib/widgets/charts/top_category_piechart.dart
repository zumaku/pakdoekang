import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class TopCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreServiceProvider =
        Provider.of<FirestoreServiceProvider>(context);
    return StreamBuilder<List<Transaksi>>(
      stream: firestoreServiceProvider.allTransaksi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
              padding: EdgeInsets.all(10),
              child: SkeletonLoader(
                builder: Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: MyColor.base2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                items: 1,
                period: Duration(seconds: 2),
              ));
        } else if (snapshot.hasError) {
          return Center(
              child: Container(
                  height: 300,
                  child: MyText.paragraphOne('Error ${snapshot.error}')));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Container(
                  height: 300,
                  child: MyText.paragraphOne('No data available')));
        } else {
          return _buildPieChart(snapshot.data!);
        }
      },
    );
  }

  Widget _buildPieChart(List<Transaksi> transactions) {
    var topCategories = _getTopCategories(transactions);

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            MyText.headingSix("Top 5 Category"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: topCategories.map((category) {
                return Expanded(
                  child: Column(
                    children: [
                      MyCategoryIcon.getCategoryIcon(category.key),
                      MyText.labelTwo(category.key),
                    ],
                  ),
                );
              }).toList(),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  sections: _getPieChartSections(topCategories),
                  centerSpaceRadius: 50,
                  sectionsSpace: 5,
                ),
              ),
            ),
          ],
        ));
  }

  List<MapEntry<String, int>> _getTopCategories(List<Transaksi> transactions) {
    Map<String, int> categoryCount = {};

    // Process each transaction to count categories
    for (var transaksi in transactions) {
      for (var category in transaksi.kategori) {
        categoryCount[category] = (categoryCount[category] ?? 0) + 1;
      }
    }

    // Get the top 5 categories
    var sortedCategories = categoryCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedCategories.take(5).toList();
  }

  List<PieChartSectionData> _getPieChartSections(
      List<MapEntry<String, int>> topCategories) {
    return List.generate(topCategories.length, (i) {
      final category = topCategories[i];
      final bool isTouched = false;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 60;

      return PieChartSectionData(
        color: _getColor(i),
        value: category.value.toDouble(),
        title: '${category.value}%',
        radius: radius,
        titleStyle: MyText.getButtonThreeStyle(color: Colors.white),
        badgeWidget: MyCategoryIcon.getCategoryIcon(category.key),
        badgePositionPercentageOffset: 1.1,
      );
    });
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return MyColor.brand5;
      case 1:
        return MyColor.brand4;
      case 2:
        return MyColor.base4;
      case 3:
        return MyColor.base3;
      case 4:
        return MyColor.base2;
      default:
        return MyColor.brand1;
    }
  }
}
