import 'package:flutter/material.dart';

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