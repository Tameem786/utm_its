import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/models/posts.dart';

class AdminJob extends StatelessWidget {
  const AdminJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(title: Text('Job Posts')),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('jobposts').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return data['title'] != null
                      ? JobPost(
                          title: data['title'],
                          company: data['company'],
                          description: data['description'],
                          jobID: data['id'],
                          approval: data['approval'],
                        )
                      : Container();
                },
              );
            }

            return Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}
