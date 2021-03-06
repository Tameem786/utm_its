import 'package:flutter/material.dart';
import 'package:utm_its/main.dart';
import 'package:utm_its/view_application.dart';
import 'package:utm_its/view_internships.dart';
import 'package:utm_its/view_jobposts.dart';
import 'package:utm_its/view_logbook.dart';
import 'package:utm_its/view_profile.dart';

class StudentScreen extends StatefulWidget {
  final String id;
  final String name;
  const StudentScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Hi, ${widget.name}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfile(
                                          id: widget.id,
                                        )));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'View Profile',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewInternship(
                                          id: widget.id,
                                        )));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Search Internships',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewApplication(
                                          isAdmin: false,
                                          id: widget.id,
                                        )));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Application Status',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JobPosts(
                                          id: widget.id,
                                        )));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Job Posts',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewLogbook(
                                          id: widget.id,
                                        )));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Logbook',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            // await FirebaseAuth.instance.signOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyApp();
                                },
                              ),
                            );
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Logout',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
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
