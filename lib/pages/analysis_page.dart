import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/buttons/reguler_btn.dart';
import 'package:pakdoekang/widgets/charts/activity_heatmap.dart';
import 'package:pakdoekang/widgets/charts/spending_earn_linechart.dart';
import 'package:pakdoekang/widgets/charts/top_category_piechart.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  int selectedChart = 0;

  void setSelectedChart(int index) {
    setState(() {
      selectedChart = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> charts = [
      SpendEarnLineChart(),
      TopCategory(),
      ActivityHeatmap(),
    ];

    return SingleChildScrollView(
      child: SafeArea(
        minimum: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                SizedBox(width: 10),
                selectedChart == 0
                    ? MyRegulerBtn.smallBrand(
                        text: "Grafik Aktivitas",
                        onTap: () => setSelectedChart(0))
                    : MyRegulerBtn.smallBase(
                        text: "Grafik Aktivitas",
                        onTap: () => setSelectedChart(0)),
                SizedBox(width: 5),
                selectedChart == 1
                    ? MyRegulerBtn.smallBrand(
                        text: "Top Kategori", onTap: () => setSelectedChart(1))
                    : MyRegulerBtn.smallBase(
                        text: "Top Kategori", onTap: () => setSelectedChart(1)),
                SizedBox(width: 5),
                selectedChart == 2
                    ? MyRegulerBtn.smallBrand(
                        text: "Intensitas Harian",
                        onTap: () => setSelectedChart(2))
                    : MyRegulerBtn.smallBase(
                        text: "Intensitas Harian",
                        onTap: () => setSelectedChart(2)),
                SizedBox(width: 10),
              ]),
            ),
            SizedBox(height: 14),
            charts[selectedChart],
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
