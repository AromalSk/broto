import 'package:broto/functions/db_functions.dart';
import 'package:broto/screen/ListStudent.dart';
import 'package:broto/screen/screen_data.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ScreenData(),
           Expanded(child: ListStudentWidget())
          ],
        ),
      ),
    );
  }
}