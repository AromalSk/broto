import 'package:broto/functions/db_functions.dart';
import 'package:broto/model/data_model.dart';
import 'package:flutter/material.dart';

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

class ScreenData extends StatelessWidget {
  const ScreenData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Age'
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              OnAddStudentButtonClicked();
            }, child: Text('Add student'),),
            SizedBox(height: 10,),
          ],
        )
    );
  }

  Future <void> OnAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return ;
    }
   // print('$_name $_age');

    final _student = StudentModel(name: _name, age: _age);

    addStudent(_student);

  }

}




