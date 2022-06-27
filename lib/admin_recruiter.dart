import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/models/guest.dart';

class AdminRecruiter extends StatefulWidget {
  const AdminRecruiter({Key? key}) : super(key: key);

  @override
  State<AdminRecruiter> createState() => _AdminRecruiterState();
}

class _AdminRecruiterState extends State<AdminRecruiter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Recruiters'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance.collection('recruiters').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return data['name'] != null
                      ? Guest(
                          name: data['name'],
                          email: data['email'],
                          id: data['id'])
                      : Container();
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
