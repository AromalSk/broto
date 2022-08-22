import 'package:broto/functions/db_functions.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:(BuildContext ctx, List <StudentModel> studentList, Widget?child) {
        return ListView.separated(
          itemBuilder:(ctx,index){
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(onPressed: (){
                  deleteStudents(index);
              }, icon:Icon(Icons.delete,color: Colors.blue,)),
            );
          },
          separatorBuilder:(ctx,index){
            return Divider();
          },
          itemCount: studentList.length);
      }  ,
    );
  }
}
