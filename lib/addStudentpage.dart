import 'package:flutter/material.dart';
import 'package:student/home.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  Student stuInfo = Student();
  final _formKey = GlobalKey<FormState>();
  FocusNode focus1 = FocusNode(), focus2 = FocusNode(), focus3 = FocusNode();
  bool autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
      autovalidate : autovalidate,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Center(
              child: Text('ADD NEW STUDENT'),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: 'NAME'),
              onChanged: (value) {
                setState(() {
                  stuInfo.name = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'PLEASE ENTER NAME';
                }
                return null;
              },
              onFieldSubmitted: (v){
                FocusScope.of(context).requestFocus(focus1);
              },
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              focusNode: focus1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: 'AGE'),
              onChanged: (value) {
                setState(() {
                  stuInfo.age = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'PLEASE ENTER AGE';
                }
                return null;
              },
               onFieldSubmitted: (v){
                FocusScope.of(context).requestFocus(focus2);
              },
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              focusNode: focus2,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: 'ROLL No.'),
              onChanged: (value) {
                setState(() {
                  stuInfo.roll = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'PLEASE ENTER Roll No.';
                }
                return null;
              },
               onFieldSubmitted: (v){
                FocusScope.of(context).requestFocus(focus3);
              },
            ),
            SizedBox(height: 4),
            TextFormField(
              focusNode: focus3,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'GRADE'),
              maxLength: 2,
              onChanged: (value) {
                setState(() {
                  stuInfo.grade = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'PLEASE ENTER NAME';
                }
                return null;
              },
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('Save'),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                        Navigator.pop(context, stuInfo);
                        }
                        autovalidate = true;
                      });
                    },
                  ),
                ])
          ]),
        ),
      ),
    );
  }
}
