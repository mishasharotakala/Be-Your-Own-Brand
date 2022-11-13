import 'package:be_your_own_brand/pages/travel_ui/activity_screen.dart';
import 'package:be_your_own_brand/pages/travel_ui/hotel_screen.dart';
import 'package:be_your_own_brand/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/activities",
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelScreen.routeName: ((context) => const ActivitiesScreen()),
      },
      builder: (context, child) {
        return _TravelApp(
          navigator:(child!.key as GlobalKey<NavigatorState>),
          child: child,
        );
      },

    );
  }
}



class _TravelApp extends StatefulWidget {
  const _TravelApp({
    super.key, 
    required this.navigator, 
    required this.child });

  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  @override
  State<_TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<_TravelApp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF5EDDC),
      body: Row(
        children: [
          SideBar(
            height: height, 
            width: width,
            navigator: widget.navigator,
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}