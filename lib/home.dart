import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addStudentpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Student> list = [];

  void initState() {
    super.initState();
    Firestore.instance.collection("students").getDocuments().then((querySnapshot){
      var data = querySnapshot.documents; 
      list = data.map((f) =>Student.fromMap(f.data))
      .toList();
      setState(() {});
    });
  }
  
  addToList(Student student) async {
    setState(() {
      list.add(student);
    });
    await Firestore.instance.collection("students").add(student.toMap());
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Student')),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              Student s = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: AddStudentPage(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    );
                  });
              if (s != null) addToList(s);
            }),
        body: list == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : list.length == 0
                ? Center(child: Text('STUDENTS INFO NOT AVAILABLE'))
                : buildBody());
  }

  Widget buildBody() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return buildItem(list[index], index);
      },
    );
  }

  Widget buildItem(Student item, index) {
    return ListTile(
      leading: Text(item.name),
      title: Text(item.roll),
      subtitle: Text(item.grade),
    );
  }
}

class Student {
  String name;
  String roll;
  String age;
  String grade;

  Student({this.name, this.age, this.roll, this.grade});

  Map<String, String> toMap() {
    return {
      'name': name,
      'roll': roll,
      'age': age,
      'grade': grade,
    };
  }

  static Student fromMap(Map<String, dynamic> data){
    return Student(
    name:data["name"],
    age:data["age"],
    roll:data["roll"],
    grade:data["grade"],
    );
   }
}
