import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/models/logbook.dart';

class Book extends StatefulWidget {
  const Book({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);
  final String id;
  final String name;

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var _submitted;

  Future<void> _isItems() async {
    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection('logbooks')
        .doc(widget.id)
        .collection(widget.name);

    QuerySnapshot querySnapshot = await collectionRef.get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        _submitted = true;
      });
    } else {
      setState(() {
        _submitted = false;
      });
    }

    print('${widget.name} $_submitted');
  }

  void initState() {
    super.initState();
    _isItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        color: _submitted == false
            ? Colors.teal
            : Color.fromARGB(255, 123, 122, 122),
        child: Center(
            child: TextButton(
          onPressed: _submitted == false
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogBook(
                        week: widget.name,
                        id: widget.id,
                      ),
                    ),
                  );
                }
              : null,
          child: Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )),
      ),
    );
  }
}
