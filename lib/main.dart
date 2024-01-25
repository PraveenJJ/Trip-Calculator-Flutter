import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Set the appBar property to null
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/forest_road_aerial_view_198687_2048x1152.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
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
            Center(
              child: SizedBox(
                width: 320,
                height: 500,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
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
                        labelColor: Colors
                            .blue[900], // Set the color for the active tab text
                        unselectedLabelColor: Colors
                            .grey[500], // Set the color for inactive tab text
                        // indicator: BoxDecoration(
                        //   color: Colors.grey[300]!, // Set the color for inactive tab background
                        //   borderRadius: BorderRadius.circular(10.0), // Add rounded corners to the indicator
                        // ),
                      ),
                      // Distance Tab Content
                      Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  buildLabeledTextField(
                                      label: 'Enter amount spent on Fuel (Rs.)'),
                                  buildLabeledTextField(label: 'Enter current reading of Odometer'),
                                  buildLabeledTextField(
                                      label: 'Enter fuel price (Rs.)'),
                                  buildLabeledTextField(label: "Enter vehicle's mileage (kms/ltr)"),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle form submission
                                    },
                                    child: const Text('Calculate Distance'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
      const SizedBox(height: 10.0),
      SizedBox(
        height: 40.0, // Set the desired height here
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
