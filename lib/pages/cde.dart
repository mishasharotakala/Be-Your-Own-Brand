import 'dart:ui';

import 'package:be_your_own_brand/widgets/cde_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cde extends StatefulWidget {
  const Cde({super.key});

  @override
  State<Cde> createState() => _CdeState();
}

class _CdeState extends State<Cde> {
  List<String> data = [
    "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/7012328/media/bcd672685071ca4da27d5f3ea44ac5db.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/6727912/samji_illustrator.jpeg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/10940512/media/b2a8ea95c550e5f09d0ca07682a3c0da.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/8616916/media/a7e39b15640f8883212421d134013e38.jpg?compress=1&resize=600x600",
    //"https://cdn.dribbble.com/users/3281732/screenshots/6590709/samji_illustrator.jpg?compress=1&resize=600x600",
  ];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        centerTitle: true,
        title: const Text(
          "Be your own brand",
          style: TextStyle(
            fontFamily: "BeautifulPeoplePersonalUse",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('hair').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isNotEmpty == true) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/be-your-own-brand-fb605.appspot.com/o/Double%20Drawn%20Frontal%20Lace%20Wig.jpg?alt=media&token=23d940cb-9a70-4524-8b35-76ddfc678f0b"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15,
                        sigmaY: 15,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: 0.55,
                    //widthFactor: double.infinity,
                    //heightFactor: MediaQuery.of(context).size.height * 0.0009,
                    child: PageView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index){
                        return FractionallySizedBox(
                          //widthFactor: MediaQuery.of(context).size.width * 0.0023,
                          widthFactor: 0.8,
                          child: CdeWidget(
                            image: snapshot.data?.docs[index]['image'], 
                            //name: snapshot.data?.docs[index]['name'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            else{
              return const Center(
                child: Text("Nothing"),
              );
            }
          }
          return const Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          );
        }
      ),
    );
  }
}