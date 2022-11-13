import 'package:be_your_own_brand/widgets/activity.dart';
import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "${activity.id}_${activity.title}",
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  activity.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}