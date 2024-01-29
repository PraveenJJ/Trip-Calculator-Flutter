import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter_application_1/widgets/distance_form_container.dart';
import 'package:flutter_application_1/widgets/fuel_form_container.dart';
import 'package:flutter_application_1/widgets/tab_bar_container.dart';
import 'package:flutter_application_1/widgets/trip_calculator_tile.dart';

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
