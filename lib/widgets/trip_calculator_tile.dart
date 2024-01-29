import 'package:flutter/material.dart';

class TripCalculatorTitle extends StatelessWidget {
  const TripCalculatorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
        child: Text(
          'Trip Calculator',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w100,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}