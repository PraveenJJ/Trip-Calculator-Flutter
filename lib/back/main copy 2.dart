import 'package:flutter/material.dart';

void main() {
  runApp(TripCalculatorApp());
}

class TripCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Calculator',
      home: TripCalculatorScreen(),
    );
  }
}

class TripCalculatorScreen extends StatefulWidget {
  @override
  _TripCalculatorScreenState createState() => _TripCalculatorScreenState();
}

class _TripCalculatorScreenState extends State<TripCalculatorScreen> {
  String activeTab = 'calculate-distance';

  void openTab(String tabName) {
    setState(() {
      activeTab = tabName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Trip Calculator',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => openTab('calculate-distance'),
                  style: ButtonStyle(
                    backgroundColor: activeTab == 'calculate-distance'
                        ? MaterialStateProperty.all<Color>(Colors.blue)
                        : null,
                  ),
                  child: Text('Distance'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => openTab('calculate-fuel'),
                  style: ButtonStyle(
                    backgroundColor: activeTab == 'calculate-fuel'
                        ? MaterialStateProperty.all<Color>(Colors.blue)
                        : null,
                  ),
                  child: Text('Fuel'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            activeTab == 'calculate-distance'
                ? CalculateDistanceForm()
                : CalculateFuelForm(),
          ],
        ),
      ),
    );
  }
}

class CalculateDistanceForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Include the form widgets here (similar to the HTML form)
          // ...

          // Additional widgets can be added for displaying results
        ],
      ),
    );
  }
}

class CalculateFuelForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Include the form widgets here (similar to the HTML form)
          // ...

          // Additional widgets can be added for displaying results
        ],
      ),
    );
  }
}
