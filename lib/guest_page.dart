import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  late User _user;
  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(_user.displayName.toString()),
      ),
    );
  }
}
