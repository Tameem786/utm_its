import 'package:flutter/material.dart';

class ViewSupervisor extends StatelessWidget {
  const ViewSupervisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Supervisor'),
      ),
      body: Container(),
    );
  }
}
