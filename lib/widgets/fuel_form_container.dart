import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class FuelFormContainer extends StatefulWidget {
  const FuelFormContainer({Key? key}) : super(key: key);
  @override
  FuelFormContainerState createState() => FuelFormContainerState();
}

class FuelFormContainerState extends State<FuelFormContainer> {
  final TextEditingController _travelDistanceController =
      TextEditingController();
  final TextEditingController _fuelPriceController =
      TextEditingController(text: '101.95');
  final TextEditingController _mileageController =
      TextEditingController(text: '45');

  double fuelCostValue = 111;

  Future<void> _calculateFuelCost() async {
    double travelDistance = double.parse(_travelDistanceController.text);
    double fuelPrice = double.parse(_fuelPriceController.text);
    double mileage = double.parse(_mileageController.text);

    double fuelCost = ((travelDistance / mileage) * fuelPrice).roundToDouble();

    setState(() {
      fuelCostValue = fuelCost;
    });
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
                const Text('Enter travel distance (kms)',
                    style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _travelDistanceController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    textAlignVertical: TextAlignVertical.top,
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
                const Text('Enter fuel price (Rs.)',
                    style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _fuelPriceController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    textAlignVertical: TextAlignVertical.top,
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
                const Text('Enter vehicle\'s mileage (kms/ltr)',
                    style: TextStyle(fontWeight: FontWeight.normal)),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 35.0, // Set the desired height here
                  child: TextFormField(
                    controller: _mileageController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    textAlignVertical: TextAlignVertical.top,
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
                  _calculateFuelCost();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: const Text(
                  'CALCULATE FUEL COST',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: const Text(
                    'Fuel Cost',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                AnimatedFlipCounter(
                  value: fuelCostValue,
                  duration: const Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  textStyle: const TextStyle(fontSize: 40, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}