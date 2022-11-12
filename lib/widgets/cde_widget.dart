import 'package:flutter/material.dart';

class CdeWidget extends StatefulWidget{
  final String image;
  //final String label;
  

  const CdeWidget({super.key, 
    required this.image,
    //required this.label,
  });

  @override 
  State<CdeWidget> createState() => _CdeWidget();
}

class _CdeWidget extends State<CdeWidget> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );

    /*return Container(
      margin: const EdgeInsets.all(8),
      //height: MediaQuery.of(context).size.height * 0.0001,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
          child: Ink.image(
            image: NetworkImage(
              widget.image,
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.cover,
          ),
          
        ),
      );*/
  }
}