import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habitz/constants/color.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({
    super.key,
    required this.startDate,
    required this.datasets,
  });

  final DateTime startDate;
  final Map<DateTime, int> datasets;

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: datasets,
      colorMode: ColorMode.color,
      defaultColor: AppColors.tertiary,
      textColor: Colors.white,
      showColorTip: false,
      size: 30.0,
      colorsets: {
        1: Colors.green.shade200,
        2: Colors.green.shade400,
        3: Colors.green.shade600,
        4: Colors.green.shade800,
        5: Colors.green.shade900,
      },
    );
  }
}
