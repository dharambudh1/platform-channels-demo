import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _batteryLevel = 'Unknown battery level.';
  static const platform = MethodChannel('getBatteryLevelMethodChannel');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result =
          await platform.invokeMethod('getBatteryLevelInvokeMethod');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "If using the iOS Simulator, note that it doesn’t support battery APIs, and the app displays ‘Battery level not available’.",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Battery level: $_batteryLevel',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getBatteryLevel,
        child: const Icon(Icons.battery_unknown),
      ),
    );
  }
}