main(List<String> args) {
  College c = new College('ASCOL', 'THAMEL');
  print(c.name);
  
  Class cl = new Class('IT', 'Morning');
  print(cl.name);
  
  Student s= new Student('Jack', 150);
   print(s.name);
  
  Teacher t = new Teacher( 10, 'Bob', 'KTM');
  print(t.name);
}
 
class College {
  String name;
  String address;
 
  College(this.name, this.address);
}



class Class {
  String name;
  String shift;
  
  Class(this.name, this.shift);
}


class Student {
  String name;
  int roll;
  
  Student(this.name, this.roll);
}


class Teacher {
  int id;
  String name;
  String address;
  
  Teacher(this.id, this.name, this.address);
}