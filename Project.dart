//import 'dart:io';
// tried to incorporate user input but was giving list conversion error as you saw in class Sir
class Person {
  String name;

  Person(this.name);

  void displayInfo() {
    print("Person: $name");
  }
}

class Teacher extends Person {
  String subject;
  double salary;
  static List<Teacher> teachersList = [];

  Teacher(String name, this.subject, this.salary) : super(name) {
    teachersList.add(this);
  }

  @override
  void displayInfo() {
    print("Teacher: $name, Subject: $subject, Salary: $salary");
  }

  @override
  String toString() {
    return "Teacher: $name, Subject: $subject, Salary: $salary";
  }

  static void hireTeacher(String name, String subject, double salary) {
    Teacher newTeacher = Teacher(name, subject, salary);
    print("New teacher hired: $newTeacher");
    print("Updated list of teachers: $teachersList");
  }

  static void removeTeacher(String name) {
    teachersList.removeWhere((teacher) => teacher.name == name);
    print("Teacher removed: $name");
    print("Updated list of teachers: $teachersList");
  }

  // static void activeTeacher(var name) {
  //   //var name = stdin.readLineSync();
  //   if (teachersList.contains(name)) {
  //     print('$name is present');
  //   } else {
  //     print('$name is not present');
  //   }
  // }

  static void activeTeacher(String name) {
    var teacher = teachersList.firstWhere((teacher) => teacher.name == name,
        orElse: () => Teacher("", "", 0.0));
    if (teacher.name.isNotEmpty) {
      print('$name is present');
    } else {
      print('$name is not present');
    }
  }
}

class Student extends Person {
  int grade;
  int age;
  static List<Student> studentsList = [];

  Student(String name, this.grade, this.age) : super(name) {
    studentsList.add(this);
  }

  @override
  void displayInfo() {
    print("Student: $name, Grade: $grade, Age: $age");
  }

  @override
  String toString() {
    return "Student: $name, Grade: $grade, Age: $age";
  }

  static void enrollStudent(String name, int grade, int age) {
    Student newStudent = Student(name, grade, age);
    print("New student enrolled: $newStudent");
    print("Updated list of students: $studentsList");
  }

  static void removeStudent(String name) {
    studentsList.removeWhere((student) => student.name == name);
    print("Student removed: $name");
    print("Updated list of students: $studentsList");
  }

  // void activeStudent() {
  //   var name = stdin.readLineSync();
  //   if (students.contains(name)) {
  //     print('$name is present');
  //   } else {
  //     print('$name is not present');
  //   }
  // }

  static void activeStudent(String name) {
    var student = studentsList.firstWhere((student) => student.name == name,
        orElse: () => Student("", 0, 0));
    if (student.name.isNotEmpty) {
      print('$name is present');
    } else {
      print('$name is not present');
    }
  }
}

void main() {
  List<Person> people = [
    Teacher("Saleem Khan", "Dart", 500000),
    Teacher("Fiza Ali", "Math", 25000),
    Student("Samama Ali", 10, 20),
    Student("Sufian Salman", 9, 22),
  ];

  for (Person person in people) {
    person.displayInfo();
  }

  Teacher.hireTeacher("Nadeem Mehmood", "Pak studies", 60000);
  Teacher.removeTeacher("Fiza Ali");
  Teacher.activeTeacher("Saleem Khan");

  Student.enrollStudent("Babar Azam", 16, 25);
  Student.removeStudent("Samama Ali");
  Student.activeStudent("Samama Ali");
}
