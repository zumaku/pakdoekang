import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/buttons/icon_button.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';

class TopCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreServiceProvider =
        Provider.of<FirestoreServiceProvider>(context);

    return StreamBuilder<List<Transaksi>>(
      stream: firestoreServiceProvider.allTransaksi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return _buildPieChart(snapshot.data!);
        }
      },
    );
  }

  Widget _buildPieChart(List<Transaksi> transactions) {
    var topCategories = _getTopCategories(transactions);

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1 / .8,
          child: PieChart(
            PieChartData(
              sections: _getPieChartSections(topCategories),
              centerSpaceRadius: 40,
              sectionsSpace: 5,
            ),
          ),
        ),
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
      ],
    );
  }

  List<MapEntry<String, int>> _getTopCategories(List<Transaksi> transactions) {
    Map<String, int> categoryCount = {};

    // Process each transaction to count categories
    for (var transaksi in transactions) {
      for (var category in transaksi.kategori) {
        categoryCount[category] = (categoryCount[category] ?? 0) + 1;
      }
    }

    // Get the top 3 categories
    var sortedCategories = categoryCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedCategories.take(5).toList();
  }

  List<PieChartSectionData> _getPieChartSections(
      List<MapEntry<String, int>> topCategories) {
    return List.generate(topCategories.length, (i) {
      final category = topCategories[i];
      final isTouched = false;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;

      return PieChartSectionData(
        color: _getColor(i),
        value: category.value.toDouble(),
        title: '${category.value}%',
        radius: radius,
        titleStyle: MyText.getButtonThreeStyle(color: Colors.white),
        badgeWidget: MyCategoryIcon.getCategoryIcon(category.key),
        badgePositionPercentageOffset: 1.1,
        // titlePositionPercentageOffset: .,
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
