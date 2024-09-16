import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/model/student_model.dart';

import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Page",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          SizedBox(height: 20);
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(studentList[index].image),
              radius: 35,
            ),
            title: Text(
              studentList[index].name,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(studentList[index].std.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    studentList.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.details_page,
          ).then(
            (value) => setState(() {}),
          );
        },
        backgroundColor: Colors.blue,
        splashColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
