import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Variable Height Tabs',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/forest_road_aerial_view_198687_2048x1152.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: SizedBox(
                    width: 320,
                    child: ListView(
                      children: <Widget>[
                        // Title widget
                        const TripCalculatorTitle(),

                        // Tab bar widget
                        TabBarContainer(tabController: _tabController),

                        // Tab bar content widget
                        Center(
                          child: [
                            // Container for Distance form
                            const DistanceFormContainer(),

                            // Container for Fuel form
                            const FuelFormContainer(),
                          ][_tabController.index],
                        ),
                      ],
                    )))));
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

class TripCalculatorTitle extends StatelessWidget {
  const TripCalculatorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 5.0),
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

class TabBarContainer extends StatelessWidget {
  final TabController tabController;

  const TabBarContainer({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.blue[900],
        tabs: const [
          Tab(
            text: 'Distance',
            icon: Icon(Icons.sync_alt_outlined),
          ),
          Tab(
            text: 'Fuel',
            icon: Icon(Icons.local_gas_station),
          ),
        ],
        unselectedLabelColor: Colors.grey[500],
      ),
    );
  }
}

class DistanceFormContainer extends StatelessWidget {
  const DistanceFormContainer({Key? key}) : super(key: key);

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
            buildLabeledTextField(label: 'Enter amount spent on Fuel (Rs.)'),
            buildLabeledTextField(label: 'Enter current reading of Odometer'),
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
                    const AnimatedFlipCounter(
                      value: 0,
                      duration: Duration(seconds: 2),
                      curve: Curves.elasticOut,
                      textStyle: TextStyle(fontSize: 40, color: Colors.black),
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
                      child: const AnimatedFlipCounter(
                        value: 0,
                        duration: Duration(seconds: 2),
                        curve: Curves.elasticOut,
                        textStyle: TextStyle(fontSize: 40, color: Colors.black),
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
