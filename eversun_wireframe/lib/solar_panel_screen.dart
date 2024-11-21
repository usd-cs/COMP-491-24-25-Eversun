import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SolarPanelScreen extends StatelessWidget {
  const SolarPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Solar panel'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Day'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('2 weeks'),
              ),
            ],
          ),
          Expanded(
            child: BarChart(
              // Add chart configuration here
              BarChartData()
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Average power'),
                const Text('400W'),
                const Text('Total power'),
                const Text('600Wh'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
