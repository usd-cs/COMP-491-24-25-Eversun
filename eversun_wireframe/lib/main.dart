import 'package:flutter/material.dart';
import 'solar_panel_screen.dart';
import 'battery_screen.dart';
import 'led_brightness_screen.dart';
import 'tower_screen.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar Panel Monitor',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amber,
          background: Colors.black,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const DashboardScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/tower': (context) => const TowerScreen(),
        '/solar': (context) => const SolarPanelScreen(),
        '/battery': (context) => const BatteryScreen(batteryId: 1),
        '/brightness': (context) => const LEDBrightnessScreen(lightId: 1),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TowerScreen();
  }
}
