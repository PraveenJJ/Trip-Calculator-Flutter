import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Variable Height Tabs',
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

  Widget _listItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blueAccent,
        ),
      ),
      height: 120,
      child: const Center(
        child: Text('List Item', style: TextStyle(fontSize: 20.0)),
      ),
    );
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
                        const Center(
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
                        ),

                        // Tab bar code - Distance, Fuel
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors
                                .white, // Background color of the container
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(10), // Top left corner radius
                              topRight: Radius.circular(
                                  10), // Top right corner radius
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
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
                        ),

                        // Tab bar view code - Distance, Fuel
                        Center(
                          child: [
                            // Container for Distance form
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors
                                    .white, // Background color of the container
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      10), // Top left corner radius
                                  bottomRight: Radius.circular(
                                      10), // Top right corner radius
                                ),
                              ), // Background color of the container
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    buildLabeledTextField(
                                        label:
                                            'Enter amount spent on Fuel (Rs.)'),
                                    buildLabeledTextField(
                                        label:
                                            'Enter current reading of Odometer'),
                                    buildLabeledTextField(
                                        label: 'Enter fuel price (Rs.)'),
                                    buildLabeledTextField(
                                        label:
                                            "Enter vehicle's mileage (kms/ltr)"),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 5.0, 0.0, 0.0),
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Handle form submission
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[
                                              900], // Set your desired button color here
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                        child: const Text('CALCULATE DISTANCE',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container for Fuel form
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors
                                    .white, // Background color of the container
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      10), // Top left corner radius
                                  bottomRight: Radius.circular(
                                      10), // Top right corner radius
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    buildLabeledTextField(
                                        label: 'Enter travel distance (kms)'),
                                    buildLabeledTextField(
                                        label: 'Enter fuel price (Rs.)'),
                                    buildLabeledTextField(
                                        label:
                                            "Enter vehicle's mileage (kms/ltr)"),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 5.0, 0.0, 0.0),
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Handle form submission
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[
                                              900], // Set your desired button color here
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                        child: const Text('CALCULATE FUEL COST',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
