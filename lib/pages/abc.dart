import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Abc extends StatefulWidget {
  const Abc({super.key});

  @override
  State<Abc> createState() => AbcState();
}

class AbcState extends State<Abc> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hello World \n Welcome",
          style: TextStyle(
            fontFamily: "Signamaestro",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("hair").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            reverse: false,
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListTile(
                      title: Image.network(
                        document["image"],
                        width: MediaQuery.of(context).size.width * 0.50,
                      ),
                      subtitle: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          document["name"],
                          style: const TextStyle(
                            fontFamily: "BeautifulPeoplePersonalUse",
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}