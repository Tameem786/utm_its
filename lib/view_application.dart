import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/models/application.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({
    Key? key,
    required this.isAdmin,
    required this.id,
  }) : super(key: key);
  final bool isAdmin;
  final String id;

  @override
  State<ViewApplication> createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('applications')
              .doc(widget.id)
              .collection(widget.id)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return data['company'] != null
                      ? Application(
                          company: data['company'],
                          location: data['location'],
                          status: data['status'],
                          isAdmin: widget.isAdmin,
                          applicationID: data['applicationid'],
                          id: widget.id,
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
