import 'package:flutter/material.dart';
import 'package:flip_panel/flip_panel.dart'; // Importing the package for the flip counter widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Distance and Fuel Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Distance'),
              Tab(text: 'Fuel'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DistanceTab(),
            FuelTab(),
          ],
        ),
      ),
    );
  }
}

class DistanceTab extends StatefulWidget {
  @override
  _DistanceTabState createState() => _DistanceTabState();
}

class _DistanceTabState extends State<DistanceTab> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController fuelPriceController = TextEditingController();
  TextEditingController mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter amount spent on Fuel (Rs.)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter amount spent on fuel';
                }
                return null;
              },
            ),
            TextFormField(
              controller: odometerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter current reading of Odometer'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter current odometer reading';
                }
                return null;
              },
            ),
            TextFormField(
              controller: fuelPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter fuel price (Rs.)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter fuel price';
                }
                return null;
              },
            ),
            TextFormField(
              controller: mileageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter vehicle's mileage (kms/ltr)"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter vehicle's mileage";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process the data
                  // You can add your logic here
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            AnimatedFlipCounter(
              value: 0, // Initial value
              duration: Duration(milliseconds: 500), // Duration for the animation
            ),
          ],
        ),
      ),
    );
  }
}

class FuelTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Fuel Tab Content',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
