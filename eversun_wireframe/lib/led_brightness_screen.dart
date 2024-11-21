import 'package:flutter/material.dart';

class LEDBrightnessScreen extends StatelessWidget {
  final int lightId;

  const LEDBrightnessScreen({
    super.key,
    required this.lightId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('LED $lightId Brightness'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 48,
              color: Colors.amber,
            ),
            SizedBox(height: 20),
            Text(
              '100%',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('ON'),
          ],
        ),
      ),
    );
  }
}
