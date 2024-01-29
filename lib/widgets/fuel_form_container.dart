import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class FuelFormContainer extends StatelessWidget {
  const FuelFormContainer({Key? key}) : super(key: key);

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
            buildLabeledTextField(label: 'Enter travel distance (kms)'),
            buildLabeledTextField(label: 'Enter fuel price (Rs.)'),
            buildLabeledTextField(label: "Enter vehicle's mileage (kms/ltr)"),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
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
                const AnimatedFlipCounter(
                  value: 0,
                  duration: Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  textStyle: TextStyle(fontSize: 40, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildLabeledTextField({required String label}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.normal)),
      const SizedBox(height: 5.0),
      SizedBox(
        height: 35.0, // Set the desired height here
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          // Add any necessary validation or controller properties
        ),
      ),
      const SizedBox(height: 15.0),
    ],
  );
}
