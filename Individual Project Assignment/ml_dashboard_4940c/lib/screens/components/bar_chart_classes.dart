import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class BarChartClasses extends StatelessWidget {
  const BarChartClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        alignment: BarChartAlignment.spaceAround,
        // groupsSpace: 5,
        axisTitleData: FlAxisTitleData(
          bottomTitle: AxisTitle(
            showTitle: true,
            titleText: 'Number of Times joining Campaign',
            // margin: 5,
            textStyle: TextStyle(
              color: lightTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
                  color: lightTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
            margin: appPadding,
            getTitles: (double value) {
              if (value == 1) {
                return '0';
              } if (value == 2) {
                return '1';
              }if (value == 3) {
                return '2';
              } if (value == 4) {
                return '3';
              }if (value == 5) {
                return '4';
              }if (value == 6) {
                return '5';
              }else {
                return '';
              }
            }
          ),
          leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) => const TextStyle(
                color: lightTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              margin: appPadding,
              getTitles: (double value) {
                if (value == 0) {
                  return '0';
                } if (value == 50) {
                  return '50';
                } if (value == 100) {
                  return '100';
                } if (value == 150) {
                  return '150';
                }if (value == 200) {
                  return '200';
                }else {
                  return '';
                }
              }
            )
          ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 0,
              width: 30,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                y: 216,
                width: 30,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                y: 144,
                width: 30,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                y: 45,
                width: 30,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                y: 28,
                width: 30,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                y: 10,
                width: 30,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
        ]
      )
    );
  }
}
