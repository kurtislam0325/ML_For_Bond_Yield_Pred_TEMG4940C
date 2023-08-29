import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  List<Color> gradientColors = [
    primaryColor,
    secondaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        appPadding,
        appPadding * 1.8,
        appPadding * 1.2,
        appPadding,
      ),
      child: LineChart(LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTextStyles: (value) => TextStyle(
                color: lightTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              getTitles: (value) {
                switch(value.toInt()){
                  case 0:
                    return '0.0';
                  case 1:
                    return '0.2';
                  case 2:
                    return '0.4';
                  case 3:
                    return '0.6';
                  case 4:
                    return '0.8';
                  case 5:
                    return '1.0';
                }
                return '';
              }
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTextStyles: (value) => TextStyle(
                color: lightTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              getTitles: (value) {
                switch(value.toInt()){
                  case 0:
                    return '0.0';
                  case 20:
                    return '0.2';
                  case 40:
                    return '0.4';
                  case 60:
                    return '0.6';
                  case 80:
                    return '0.8';
                  case 100:
                    return '1.0';
                }
                return '';
              }
            ),            
          ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 5,
          maxY: 100,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
                spots: [
                  FlSpot(0, 0),
                  FlSpot(0.2, 81),
                  FlSpot(5, 100),
                ],
                colors: [primaryColor],
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    colors:
                        gradientColors.map((e) => e.withOpacity(0.3)).toList(),
                    gradientFrom: Offset(0, 0),
                    gradientTo: Offset(0, 1.75)))
          ])),
    );
  }
}
