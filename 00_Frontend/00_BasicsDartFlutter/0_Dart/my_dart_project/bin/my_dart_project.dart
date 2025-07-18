import 'package:my_dart_project/my_dart_project.dart' as my_dart_project;

import 'dart:io';
import 'dart:math';

/// This is the main entry point for the Dart project.

void main(List<String> arguments) {
  print("=== Dart Full List Framework ===");

  // Simple list operations
  List str = ["mariam", "ahmed", "ali"];
  print("Length: ${str.length}");
  print("Is empty: ${str.isEmpty}");
  print("Reversed: ${str.reversed.toList()}");
  print("First item: ${str[0]}");
  print("Index of 'mariam': ${str.indexOf("mariam")}");

  // Single element list
  List strsingle = ["ali"];
  print("Single value: ${strsingle.single}");

  // Constant list
  const List constantName = ["ahmed&mariam"];
  print("Constant list: $constantName");

  // Adding items
  List adding = ["ahmed", "mariam", "azza", "rania"];
  adding.add("ali");
  adding.addAll(["sara", "mona"]);
  adding.insertAll(0, ["Yara", "Hassan"]);
  print("List after additions: $adding");

  // Iteration using forEach
  adding.forEach((name) {
    print("Hello $name");
  });

  // Map to new values
  print("Mapped to upper case: ${adding.map((e) => "Welcome ${e.toUpperCase()}").toList()}");

  // Removing elements
  adding.removeAt(0);
  adding.removeRange(0, 2);
  adding.replaceRange(3, 5, ["ahmed", "ahmed&mariam"]);
  print("After remove/replace: $adding");

  // 3D list
  List _3D = [
    [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ],
    [
      [74, 77, 35],
      [41, 52, 63],
      [74, 28, 96],
    ],
  ];
  print("3D List: $_3D");
  print("Element [1][2][1]: ${_3D[1][2][1]}");

  // Shape detection
  int depth = _3D.length;
  int rows = _3D[0].length;
  int cols = _3D[0][0].length;
  print("Shape: [$depth][$rows][$cols]");

  // List dimension detection
  void printDimension(dynamic list) {
    if (list is List) {
      if (list.isNotEmpty && list[0] is List) {
        if (list[0].isNotEmpty && list[0][0] is List) {
          print("3D List");
        } else {
          print("2D List");
        }
      } else {
        print("1D List");
      }
    } else {
      print("Not a List");
    }
  }

  print("Dimension Check:");
  printDimension(str);
  printDimension([[1, 2], [3, 4]]);
  printDimension(_3D);

  // Merge two lists
  List l1 = ["ahmed"];
  List l2 = ["mariam"];
  List merged = [...l1, ...l2];
  print("Merged List: $merged");

  // Filter list
  List number = [1, 2, 3, 4, 5, 6, 7];
  var filtered = number.where((element) => element >= 3);
  print("Filtered >=3: ${filtered.toList()}");

  // Extra: sort and reverse
  List unsorted = [9, 2, 5, 1, 7];
  unsorted.sort();
  print("Sorted: $unsorted");
  print("Reversed: ${unsorted.reversed.toList()}");

}



////////////////////////////////////////////////////////////////////////////////

/// Application one

// void main(List<String> arguments) {
//   print("=== Dart Full Project ===");

//   // Variables & Types
//   var name = "mariam";
//   final nickname = "mimo";
//   const country = "Egypt";
//   print("I love $name ($nickname) from $country");

//   // Numbers & Conversion
//   String strNum = "7";
//   int parsed = int.parse(strNum);
//   print("Parsed int: $parsed");

//   double num1 = 7.7;
//   print("Double: ${num1.runtimeType}, toInt: ${num1.toInt()}");

//   // Arithmetic
//   print("2 / 7 = ${2 / 7}");
//   print("2 ~/ 7 = ${2 ~/ 7}");
//   print("7 % 3 = ${7 % 3}");

//   // Increment Operators
//   int inc = 0;
//   print("Post-increment: ${inc++}");
//   print("Pre-increment: ${++inc}");

//   // Logical
//   print("!(true && true): ${!(3 > 1 && 2 < 4)}");
//   /// these are all 15 string methods  Ex:  
//   /// string methods like toUpperCase, trim, contains, replaceAll and 
//   // String methods
//   String str = " Hello World ";
//   print(str.toUpperCase());
//   print("Trim");
//   print(str.trim().contains("World"));
//   print(str.replaceAll("World", "Dart"));

//   // Compare
//   print("Compare: ${"mariam".compareTo("Mariam")}");

//   // Null-aware operators
//   String? nullableString;
//   print(nullableString ?? "Default Value");

//   String? name3 = null;
//   print(name3 ?? "No Name"); // ➜ prints: No Name
//   name3 = "ahmed";
//   print(name3 ?? "No Name"); // ➜ prints: Ahmed


//   // Input
//   stdout.write("Enter your name: ");
//   String? yourName = stdin.readLineSync() ?? "Unknown";

//   stdout.write("Enter your number: ");
//   int yourNum = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

//   print("Your name is $yourName and your number is $yourNum");

//   // Conditional
//   stdout.write("Enter a key: ");
//   String? key = stdin.readLineSync();
//   if (key == "mariam") {
//     print("Welcome mariam");
//   } else if (key == "ferganey") {
//     print("Welcome ferganey");
//   } else {
//     print("Access denied");
//   }

//   // Enum usage
//   stdout.write("Enter day (mon/tue/wed): ");
//   String? inputDay = stdin.readLineSync();
//   Day? day = Day.values.firstWhere((e) => e.name == inputDay, orElse: () => Day.unknown);
//   switch (day) {
//     case Day.mon:
//       print("Start of week!");
//       break;
//     case Day.tue:
//     case Day.wed:
//       print("Midweek days");
//       break;
//     default:
//       print("Unknown day");
//   }

//   // Try-catch
//   try {
//     stdout.write("Enter number A: ");
//     int a = int.parse(stdin.readLineSync()!);
//     stdout.write("Enter number B: ");
//     int b = int.parse(stdin.readLineSync()!);
//     print("Sum: ${add(a, b)}");
//   } catch (e) {
//     print("Invalid input: $e");
//   }

//   // Assertion
//   assert(key == "mariam", "Key must be mariam");

//   // Loops
//   print("For loop:");
//   for (int i = 0; i < 3; i++) {
//     print(i);
//   }

//   print("While loop:");
//   int x = 0;
//   while (x < 2) {
//     print("x = $x");
//     x++;
//   }

//   // Collections
//   List<String> fruits = ["apple", "banana", "cherry"];
//   fruits.forEach((f) => print("Fruit: $f"));
//   print("Mapped fruits: ${fruits.map((e) => e.toUpperCase()).toList()}");

//   Map<String, int> scores = {"mariam": 100, "ferganey": 90};
//   scores.forEach((k, v) => print("$k has score $v"));

//   Set<int> nums = {1, 2, 2, 3};
//   print("Unique nums: $nums");

//   // Higher-order function
//   List<int> numbers = [1, 2, 3, 4];
//   print("Even numbers: ${numbers.where((e) => e % 2 == 0).toList()}");
//   int sum = numbers.reduce((a, b) => a + b);
//   print("Sum using reduce: $sum");

//   // Function usage
//   greet("Ahmed");
//   greet("Mariam", greeting: "Salam");
//   greet("Ali", greeting: "Hi", punctuation: "!!!");

//   // Class usage
//   Person p1 = Person(name: "Mariam", age: 22);
//   p1.sayHello();

//   // Recursive function
//   print("Factorial(5): ${factorial(5)}");

//   // Random number
//   var random = Random();
//   int rand = random.nextInt(100);
//   print("Random number: $rand");

//   // DateTime
//   DateTime now = DateTime.now();
//   print("Now: $now | Year: ${now.year}");

//   // File I/O
//   File file = File("output.txt");
//   file.writeAsStringSync("Hello Dart World!\nTime: $now\n", mode: FileMode.append);
//   print("File written: ${file.path}");
// }

// /// Enum
// enum Day { mon, tue, wed, unknown }

// /// Functions
// int add(int a, int b) => a + b;

// void greet(String name, {String greeting = "Hello", String punctuation = "."}) {
//   print("$greeting, $name$punctuation");
// }

// /// Recursive factorial
// int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);

// /// Class
// class Person {
//   String name;
//   int age;

//   Person({required this.name, required this.age});

//   void sayHello() {
//     print("Hi, I am $name and I am $age years old.");
//   }
// }
