import 'package:flutter/material.dart';
import 'battery_screen.dart';
import 'solar_panel_screen.dart';
import 'led_brightness_screen.dart';
import 'widgets/app_drawer.dart';

class TowerScreen extends StatelessWidget {
  const TowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Grid Background (first/bottom layer)
            CustomPaint(
              size: Size(screenSize.width, screenSize.height),
              painter: GridPainter(),
            ),
            
            // Tower Image
            Positioned(
              bottom: screenSize.height * 0.165,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/tower.png',
                  fit: BoxFit.contain,
                  height: screenSize.height * 0.53,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
            ),

            // Main Content with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.grey[900]!.withOpacity(0.3),
                    Colors.black,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Add spacing to push content to middle
                    SizedBox(height: screenSize.height * 0.1),
                    // Main content container
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Light status boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatusBox(
                                '100%', 
                                Icons.lightbulb_outline,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LEDBrightnessScreen(lightId: 1)),
                                ),
                              ),
                              _buildStatusBox(
                                '100%', 
                                Icons.lightbulb_outline,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LEDBrightnessScreen(lightId: 2)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.04),
                          // Battery boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildBatteryBox(
                                'Battery 1', 
                                '100%',
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BatteryScreen(batteryId: 1)),
                                ),
                              ),
                              _buildBatteryBox(
                                'Battery 2', 
                                '100%',
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BatteryScreen(batteryId: 2)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.04),
                          // Solar power indicator
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SolarPanelScreen()),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey[900]?.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey[800]!,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.solar_power, color: Colors.amber, size: 24),
                                  const SizedBox(width: 8),
                                  Text(
                                    '200W',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(Icons.solar_power, color: Colors.amber, size: 24),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bottom status icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.bluetooth, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.lock_outline, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.battery_1_bar, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.battery_2_bar, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.battery_3_bar, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.thermostat, color: Colors.red, size: 20),
                        SizedBox(width: 12),
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Menu Button (left side)
            Positioned(
              top: 16,
              left: 16,
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),

            // Centered App Title Image
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/Eversun.png',
                  height: 35,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading app title: $error');
                    return SizedBox(height: 40);
                  },
                ),
              ),
            ),

            // Runtime text (front layer)
            Positioned(
              bottom: screenSize.height * 0.72,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: Colors.white.withOpacity(1), size: 20),
                  const SizedBox(width: 9),
                  Text(
                    'Run time  2h 56m',
                    style: TextStyle(
                      color: Colors.white.withOpacity(1),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBox(String percentage, IconData icon, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[800]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber, size: 24),
            const SizedBox(width: 12),
            Text(
              percentage,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryBox(String label, String percentage, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[800]!,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.battery_full, color: Colors.amber, size: 24),
                const SizedBox(width: 12),
                Text(
                  percentage,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.26)
      ..strokeWidth = 1;

    // Draw vertical lines
    for (double i = 0; i <= size.width; i += 20) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double i = 0; i <= size.height; i += 20) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
 