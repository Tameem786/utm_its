import 'package:flutter/material.dart';
import 'package:utm_its/st_log.dart';
import 'package:utm_its/view_application.dart';

class Student extends StatefulWidget {
  const Student({
    Key? key,
    required this.name,
    required this.email,
    required this.matric,
    required this.id,
  }) : super(key: key);
  final String name;
  final String email;
  final String matric;
  final String id;

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.name.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.email.toString()),
                  Text(widget.matric.toString()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('View Logbook'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentLog()));
                  },
                ),
                ElevatedButton(
                  child: Text('View Applications'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewApplication(
                                  isAdmin: false,
                                  id: widget.id,
                                )));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
