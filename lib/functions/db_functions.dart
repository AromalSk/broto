import 'package:broto/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> StudentListNotifier = ValueNotifier([]);


Future<void> addStudent (StudentModel value)async{


final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  StudentListNotifier.value.add(value);
  StudentListNotifier.notifyListeners();
}

Future<void> getAllStudents ()async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  StudentListNotifier.value.clear();
  StudentListNotifier.value.addAll(studentDB.values);
  StudentListNotifier.notifyListeners();
}

Future<void> deleteStudents (int id) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(id);
  getAllStudents();

}