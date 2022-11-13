import 'package:be_your_own_brand/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  static const routeName = "/hotels";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 50,),
          const CustomHeader(title: "Hotels",),
        ],
      ),
    );
  }
}