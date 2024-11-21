import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BatteryScreen extends StatelessWidget {
  final int batteryId;

  const BatteryScreen({
    super.key,
    required this.batteryId,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Battery 1'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Text('Chart for 24 h'),
          Expanded(
            child: BarChart(
              // Add chart configuration here
              BarChartData()
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Temperature'),
                Text('30°C'),
                Text('Status'),
                Text('Discharging'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
