import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart'; // Import the odometer package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Odometer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    // Start the animation after the widget is initialized
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _currentValue = 9999;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Odometer Example'),
      ),
      body: Center(
        child: AnimatedOdometer(
          odometerNumber: OdometerNumber(_currentValue),
          transitionIn: (value, place, animation) {
            // Define the transition for transitioning to a new number
            return Text(
              value.toString().padLeft(4, '0'),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
          transitionOut: (value, place, animation) {
            // Define the transition for transitioning from the current number to a new number
            return Text(
              value.toString().padLeft(4, '0'),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
          duration: Duration(seconds: 5), // Specify the duration of the animation
          curve: Curves.easeInOut, // Optional: Specify the curve for the animation
          onEnd: () {
            // Optional: Callback function called every time an animation completes
            print('Animation completed!');
          },
        ),
      ),
    );
  }
}
