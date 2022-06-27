import 'package:flutter/material.dart';

class StudentLog extends StatefulWidget {
  const StudentLog({Key? key}) : super(key: key);

  @override
  State<StudentLog> createState() => _StudentLogState();
}

class _StudentLogState extends State<StudentLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(title: Text('Logbooks')),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Week 1'),
                      subtitle: Text('Data: 7/08/22'),
                    ),
                    Text('Day: Sunday'),
                    Text('Activity: Today I learned about network security.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
