import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String? fileUrl;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  PlatformFile? pickedImage;
  String? imageUrl;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    uploadFile();
  }

  Future uploadFile() async {
    final path = 'cvs/raoa/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => {
          print('Upload Complete!'),
        });
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      fileUrl = urlDownload;
    });
    print('Link: $urlDownload');
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    setState(() {
      pickedImage = result.files.first;
    });
    uploadImage();
  }

  Future uploadImage() async {
    final path = 'images/raoa/${pickedImage!.name}';
    final file = File(pickedImage!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => {
          print('Upload Complete!'),
        });
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = urlDownload;
    });
    print('Link: $urlDownload');
  }

  Future downloadFile() async {
    // First you get the documents folder location on the device...
    Directory appDocDir = await getApplicationDocumentsDirectory();
    // Here you'll specify the file it should be saved as
    // File downloadToFile = File('${appDocDir.path}/downloaded-pdf.pdf');
    final taskId = await FlutterDownloader.enqueue(
      url: fileUrl!,
      savedDir: appDocDir.path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('students')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final doc = snapshot.data;
            return doc != null
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageUrl != null
                                              ? NetworkImage(
                                                  imageUrl.toString())
                                              : NetworkImage(
                                                  'https://images.clipartlogo.com/files/istock/previews/9730/97305655-avatar-icon-of-girl-in-a-wide-brim-felt-hat.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                    ),
                                  ),
                                  Container(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      onPressed: selectImage,
                                      child: const Text(
                                        'Change Photo',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Name:'),
                                      ),
                                      Text((doc as dynamic)['name']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Major:'),
                                      ),
                                      Text((doc as dynamic)['major']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Email:'),
                                      ),
                                      Text((doc as dynamic)['email']),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   child: Row(
                                //     children: [
                                //       Padding(
                                //         padding:
                                //             const EdgeInsets.only(right: 8.0),
                                //         child: Text('User Level:'),
                                //       ),
                                //       Text((doc as dynamic)['userlevel']),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Identification No:'),
                                      ),
                                      Text((doc as dynamic)['identification']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Gender:'),
                                      ),
                                      Text((doc as dynamic)['gender']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Mobile No:'),
                                      ),
                                      Text((doc as dynamic)['mobile']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text('Address:'),
                                      ),
                                      Text((doc as dynamic)['address']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('Student\'s CV:'),
                                      TextButton(
                                        onPressed: downloadFile,
                                        child: Text(
                                          'Download',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 3, 59, 105),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: selectFile,
                                        child: Text(
                                          'Upload',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 190, 17, 17),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                pickedFile != null
                                    ? Text(pickedFile!.name)
                                    : Text('No File')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text('Null'),
                  );
          }),
    );
  }
}
