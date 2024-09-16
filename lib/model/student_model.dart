import 'dart:io';

class StudentModel {
  String name;
  int std;
  int grid;
  File image;

  StudentModel({
    required this.name,
    required this.std,
    required this.grid,
    required this.image,
  });
}

List<StudentModel> studentList = [];
