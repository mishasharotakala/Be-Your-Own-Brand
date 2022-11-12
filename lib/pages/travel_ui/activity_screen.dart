import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          SideBar(
            height: height, 
            width: width,
          ),
        ],
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  const SideBar({
    super.key, 
    required this.height, 
    required this.width, 
    //required this.navigator
  });

  final double height;
  final double width;
  //final GlobalKey<NavigatorState> navigator;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {"title": "Activities", "routeName" : "/activities"},
    {"title": "Hotels", "routeName" : "/hotels"},
    {"title": "Flights", "routeName" : "/flights"},
    {"title": "Restuarants", "routeName" : "/restuarants"},
  ];

  int sideBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      color: const Color(0xFF211955),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.05,
          ),
        ],
      ),
    );
  }
}