import 'package:flutter/material.dart';

class JobPosts extends StatelessWidget {
  const JobPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(title: Text('Job Posts')),
      body: Container(
        child: Center(
          child: Text('Currenly No Jobs have been posted'),
        ),
      ),
    );
  }
}
