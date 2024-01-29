import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class DistanceFormContainer extends StatefulWidget {
  const DistanceFormContainer({Key? key}) : super(key: key);
  @override
  DistanceFormContainerState createState() => DistanceFormContainerState();
}

class DistanceFormContainerState  extends State<DistanceFormContainer> {

  final TextEditingController _amountSpentController = TextEditingController(text: '100');
  final TextEditingController _currentOdometerController = TextEditingController(text: '8100');
  final TextEditingController _fuelPriceController = TextEditingController(text: '101.95');
  final TextEditingController _mileageController = TextEditingController(text: '45');

  double finalOdometerValue = 1111;
  double drivableKmsValue = 11;

  Future<void> _calculateDistance() async {
    double amountSpent = double.parse(_amountSpentController.text);
    double currentOdometer = double.parse(_currentOdometerController.text);
    double fuelPrice = double.parse(_fuelPriceController.text);
    double mileage = double.parse(_mileageController.text);

    double drivableKms = ((amountSpent / fuelPrice) * mileage).roundToDouble();
    double finalOdometer = currentOdometer + drivableKms;

    setState(
            () {
          drivableKmsValue = drivableKms;
          finalOdometerValue = finalOdometer;
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter amount spent on Fuel (Rs.)', style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _amountSpentController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    // Add any necessary validation or controller properties
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter current reading of Odometer', style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _currentOdometerController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    // Add any necessary validation or controller properties
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter fuel price (Rs.)', style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _fuelPriceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    // Add any necessary validation or controller properties
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter vehicle\'s mileage (kms/ltr)', style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _mileageController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    // Add any necessary validation or controller properties
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  _calculateDistance();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: const Text(
                  'CALCULATE DISTANCE',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                      child: const Text(
                        'Final Odometer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    AnimatedFlipCounter(
                      value: finalOdometerValue,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastLinearToSlowEaseIn,
                      textStyle: const TextStyle(fontSize: 40, color: Colors.black),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(70.0, 15.0, 0.0, 0.0),
                      child: const Text(
                        'Distance',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                      child: AnimatedFlipCounter(
                        value: drivableKmsValue,
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastLinearToSlowEaseIn,
                        textStyle: const TextStyle(fontSize: 40, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}