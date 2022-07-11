import 'package:flutter/material.dart';
import 'package:utm_its/models/books.dart';

class ViewLogbook extends StatefulWidget {
  const ViewLogbook({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<ViewLogbook> createState() => _ViewLogbookState();
}

class _ViewLogbookState extends State<ViewLogbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Logbook'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week1',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week2',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week3',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week4',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week5',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week6',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week7',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week8',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week9',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week10',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week11',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week12',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week13',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week14',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week15',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week16',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week17',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week18',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Book(
                      id: widget.id,
                      name: 'week19',
                    ),
                    Book(
                      id: widget.id,
                      name: 'week20',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
