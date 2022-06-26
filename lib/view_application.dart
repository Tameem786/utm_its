import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({Key? key}) : super(key: key);

  @override
  State<ViewApplication> createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
  // void _getData() async {
  //   var collection = FirebaseFirestore.instance.collection('applications');
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     var name = data['name'];
  //     var phone = data['phone'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance.collection('applications').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return data['company'] != null
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(data['company'].toString()),
                                  subtitle: Text(data['location'].toString()),
                                ),
                                Text('Status: Pending'),
                              ],
                            ),
                          ),
                        )
                      : Container();
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
        // child: ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text('Firmus Technology'),
        //               Text('Status: Applied'),
        //             ],
        //           ),
        //           ElevatedButton(
        //             onPressed: () {},
        //             child: Text('Cancel'),
        //             style: ElevatedButton.styleFrom(
        //               primary: Colors.red,
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
