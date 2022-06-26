// import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ViewInternship extends StatefulWidget {
  const ViewInternship({Key? key}) : super(key: key);

  @override
  State<ViewInternship> createState() => _ViewInternshipState();
}

class _ViewInternshipState extends State<ViewInternship> {
  List<String> titles = [];
  List<String> companies = [];
  List<String> locations = [];
  List<String> type = [];

  var notApplied = true;

  String dropdownvalue1 = 'Experience Level';
  String dropdownvalue2 = 'Company';
  String dropdownvalue3 = 'Job Type';
  String dropdownvalue4 = 'Major';
  String dropdownvalue5 = 'Salary';
  final response = [];
  // var experience_level = [
  //   'Experience Level',
  //   'Internship',
  //   'FreshGrads',
  //   '1-2 Year',
  //   '3+ Year'
  // ];
  // var company = ['Company', 'iprice', 'digi', 'cisco', 'ibm', 'intel'];
  var job_type = ['Job Type', 'On-Site', 'Remote'];
  var jobs = [];
  var field = ['Major', 'Computing', 'Software', 'IT'];
  var fields = [];
  var salary = [
    'Salary',
    '0-500',
    '500-1000',
    '1000-1500',
    '1500-2000',
    '2000+'
  ];
  var salaries = [];

  void _getData() async {
    final response = await http.get(Uri.parse(
        'https://www.linkedin.com/jobs/search?keywords=Computing&location=Malaysia&locationId=&geoId=106808692&f_TPR=&f_JT=I&position=1&pageNum=0'));
    final document = parser.parse(response.body);
    final elements = document.getElementsByClassName('base-search-card__title');
    final elements1 =
        document.getElementsByClassName('base-search-card__subtitle');
    final elements2 =
        document.getElementsByClassName('job-search-card__location');
    // final elements3 =
    //     document.getElementsByClassName('job-search-card__workplace-type');

    setState(() {
      titles = elements.map((element) => element.text.trim()).toList();
      companies = elements1.map((element) => element.text.trim()).toList();
      locations = elements2.map((element) => element.text.trim()).toList();
      // type = elements3.map((element) => element.text.trim()).toList();
      // for (var i = 0; i < titles.length; i++) {
      //   // jobs[i] = i + 1;
      //   jobs[i] = job_type[1 + Random().nextInt(job_type.length - 1)];
      //   fields[i] = field[1 + Random().nextInt(field.length - 1)];
      //   salaries[i] = salary[1 + Random().nextInt(salary.length - 1)];
      // }
    });
  }

  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Internships'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: dropdownvalue3,
                        icon: Icon(Icons.arrow_drop_down),
                        items: job_type.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue3 = newValue!;
                            type = titles.sublist(
                                0, Random().nextInt(titles.length - 0));
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: dropdownvalue4,
                        icon: Icon(Icons.arrow_drop_down),
                        items: field.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue4 = newValue!;
                            type = titles.sublist(
                                0, Random().nextInt(titles.length - 0));
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: dropdownvalue5,
                        icon: Icon(Icons.arrow_drop_down),
                        items: salary.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue5 = newValue!;
                            type = titles.sublist(
                                0, Random().nextInt((titles.length - 3) - 0));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Center(
                  child: type.isEmpty
                      ? Text(titles.length.toString() + ' Results')
                      : Text(type.length.toString() + ' Results')),
              height: MediaQuery.of(context).size.height * 0.04,
              color: Colors.grey,
            ),
          ),
          // Container(
          //     child: Center(
          //   child: Text(
          //     jobs.length.toString(),
          //   ),
          // )),
          Container(
            child: titles.length == 0
                ? Center(
                    child: Text('No Data'),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: type.isEmpty ? titles.length : type.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(titles[index].trim()),
                                  subtitle: Text(companies[index].trim()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(locations[index].trim()),
                                ),
                                notApplied
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: ElevatedButton(
                                          child: Text('Apply'),
                                          onPressed: () async {
                                            try {
                                              await FirebaseFirestore.instance
                                                  .collection('applications')
                                                  .doc()
                                                  .set({
                                                'name': titles[index],
                                                'company': companies[index],
                                                'location': locations[index],
                                                'student': 'Raoa Faria Karim',
                                              }).whenComplete(() {});
                                            } catch (err) {
                                              print(err);
                                            } finally {
                                              print('Logbook Submitted');
                                            }
                                          },
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message_outlined),
        onPressed: () {},
      ),
    );
  }
}
