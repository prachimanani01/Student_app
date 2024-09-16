import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/model/student_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

TextEditingController txtgrid = TextEditingController();
TextEditingController txtname = TextEditingController();
TextEditingController txtstd = TextEditingController();

File? myImage;

class _DetailsPageState extends State<DetailsPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ImagePicker imgPicker = ImagePicker();
  Future<void> pickImage({required ImageSource source}) async {
    XFile? xFile = await imgPicker.pickImage(
      source: source,
    );

    if (xFile != null) {
      myImage = File(xFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Details Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      radius: 75,
                      backgroundImage: (myImage != null)
                          ? FileImage(myImage!)
                          : const NetworkImage(
                                  "https://static.vecteezy.com/system/resources/previews/003/715/527/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-vector.jpg")
                              as ImageProvider),
                  FloatingActionButton.small(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Select Your Photo"),
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.blueAccent,
                          content: Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(
                                    source: ImageSource.camera,
                                  ).then(
                                    (val) {
                                      Navigator.pop(context);
                                    },
                                  );
                                  setState(() {});
                                },
                                label: Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                icon: const Icon(Icons.camera),
                              ),
                              Spacer(),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(source: ImageSource.gallery)
                                      .then(
                                    (val) => Navigator.pop(context),
                                  );
                                  setState(() {});
                                },
                                label: Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                icon: const Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'GR ID',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.bold),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: txtgrid,
              decoration: InputDecoration(
                  hintText: '01',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Text(
              'Name',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.bold),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: txtname,
              decoration: InputDecoration(
                  hintText: 'Prachi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Text(
              'Std',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.bold),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: txtstd,
              decoration: InputDecoration(
                  hintText: '12',
                  // icon: Icon(Icons.numbers),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  log("${txtname.text} ${txtstd.text} ${txtgrid.text}");
                  String name = txtname.text;
                  int std = int.parse(txtstd.text);
                  int grid = int.parse(txtgrid.text);

                  StudentModel stud = StudentModel(
                    name: name,
                    std: std,
                    grid: grid,
                    image: myImage!,
                  );

                  studentList.add(stud);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
