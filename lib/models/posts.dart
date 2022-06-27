import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobPost extends StatefulWidget {
  const JobPost({
    Key? key,
    required this.title,
    required this.company,
    required this.description,
    required this.jobID,
    required this.approval,
  }) : super(key: key);
  final String title;
  final String company;
  final String description;
  final String jobID;
  final bool approval;
  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  var _approved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.company.toString()),
                  Text(widget.description.toString()),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: widget.approval
                  ? null
                  : () async {
                      await FirebaseFirestore.instance
                          .collection('jobposts')
                          .doc(widget.jobID)
                          .update({
                        'approval': true,
                      }).whenComplete(() {
                        setState(() {
                          _approved = true;
                        });
                      });
                    },
              child: widget.approval ? Text('Approved') : Text('Approve'),
            ),
          ],
        ),
      ),
    );
  }
}
