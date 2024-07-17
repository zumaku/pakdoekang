import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakdoekang/services/api_service_provider.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SpendEarnLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiServiceProvider =
        Provider.of<ApiServiceProvider>(context);
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: apiServiceProvider.getMonthlySpendEarn(),
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
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Container(
                  height: 300,
                  child: MyText.paragraphOne('No data available')));
        }

        final data = snapshot.data!;
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              SizedBox(height: 10),
              MyText.headingSix("Grafik Aktifitas"),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    color: MyColor.base,
                  ),
                  SizedBox(width: 4),
                  MyText.paragraphOne("Pengeluaran"),
                  SizedBox(width: 10),
                  Container(
                    width: 12,
                    height: 12,
                    color: MyColor.brand,
                  ),
                  SizedBox(width: 4),
                  MyText.paragraphOne("Pemasukan"),
                ],
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: AspectRatio(
                  aspectRatio: 1, // Ensure the chart has proper constraints
                  child: LineChart(_buildLineChart(data)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  LineChartData _buildLineChart(List<Map<String, dynamic>> data) {
    List<FlSpot> spendSpots = [];
    List<FlSpot> earnSpots = [];

    for (int i = 0; i < data.length; i++) {
      final monthData = data[i];
      spendSpots.add(FlSpot(i.toDouble(), monthData['spend']));
      earnSpots.add(FlSpot(i.toDouble(), monthData['earn']));
    }

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: spendSpots,
          isCurved: false,
          color: MyColor.base3,
          barWidth: 3,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: MyColor.base2, end: MyColor.base1)
                    .lerp(0.2)!
                    .withOpacity(0.2),
                ColorTween(begin: MyColor.base2, end: MyColor.base1)
                    .lerp(0.2)!
                    .withOpacity(0.2),
              ],
            ),
          ),
        ),
        LineChartBarData(
          spots: earnSpots,
          isCurved: false,
          color: MyColor.brand3,
          barWidth: 3,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: MyColor.brand3, end: MyColor.brand1)
                    .lerp(0.3)!
                    .withOpacity(0.3),
                ColorTween(begin: MyColor.brand3, end: MyColor.brand1)
                    .lerp(0.3)!
                    .withOpacity(0.3),
              ],
            ),
          ),
        ),
      ],
      titlesData: FlTitlesData(
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              if (index >= 0 && index < data.length) {
                return Text(
                  DateFormat('MMM').format(DateTime.now().subtract(
                      Duration(days: 30 * (data.length - index - 1)))),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              }
              return Text('');
            },
            reservedSize: 20,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black, width: 1),
      ),
      gridData: FlGridData(show: true),
      backgroundColor: Colors.white,
      lineTouchData: LineTouchData(
        getTouchLineEnd: (data, index) => double.infinity,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              const FlLine(color: MyColor.brand4, strokeWidth: 3),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: MyColor.brand4,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.white,
        ),
      ),
    );
  }
}
