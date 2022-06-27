import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/logbook.dart';

class ViewLogbook extends StatefulWidget {
  const ViewLogbook({Key? key}) : super(key: key);

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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogBook(
                                          week: 'week1',
                                        )));
                          },
                          child: Text(
                            'Week 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogBook(
                                          week: 'week2',
                                        )));
                          },
                          child: Text(
                            'Week 2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.3,
                    //   height: MediaQuery.of(context).size.height * 0.1,
                    //   child: Card(
                    //     color: Colors.teal,
                    //     child: Center(
                    //         child: Text(
                    //       'Week 2',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     )),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogBook(
                                          week: 'week3',
                                        )));
                          },
                          child: Text(
                            'Week 3',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.3,
                    //   height: MediaQuery.of(context).size.height * 0.1,
                    //   child: Card(
                    //     color: Colors.teal,
                    //     child: Center(
                    //         child: Text(
                    //       'Week 3',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     )),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 4',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 6',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 7',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 8',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 9',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 10',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 11',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 13',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 14',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 15',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 16',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 17',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 18',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 19',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: Colors.teal,
                        child: Center(
                            child: Text(
                          'Week 20',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
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
