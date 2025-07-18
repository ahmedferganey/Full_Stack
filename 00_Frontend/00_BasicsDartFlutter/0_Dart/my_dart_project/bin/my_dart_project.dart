import 'package:my_dart_project/my_dart_project.dart' as my_dart_project;
import 'dart:io';

void main(List<String> arguments) {
  print('Hello world: ${my_dart_project.calculate()}!');
  var name = "mariam";
  print("i love $name");

  String num = "7";
  print(int.parse(num).runtimeType);

  double num1 = 7.7;
  print(num1.runtimeType);
  print(num1.toInt().runtimeType);
  add(3, 4);
  double num3 = 2 / 7;
  print(num3);
  // double num4 = 2 ~/ 7; /** Error: A value of type 'int' can't be assigned to a variable of type 'double'.*/

  int num4 = 2 ~/ 7;
  print(num4);
  print(1 % 2);
  num4++;
  print(num4);
  ++num4;
  print(num4);

  int num5 = 0;
  print(num5++);
  print(++num5);

  print(!(3 > 1 && 2 < 4));

  print("Enter Your Name");
  String? yourname = stdin.readLineSync();
  print("Enter Your number");
  int? yournum = int.parse(stdin.readLineSync().toString());
  print("Your Name is $yourname & Your num is $yournum");

  /// string methods
  /// - toUpperCase, toLowerCase, contains, startsWith, endsWith, substring, split, trim
  String str = "Hello World";
  String str2 = "Hello mariam";
  print(str.toUpperCase());
  print(str.toLowerCase());
  print(str.contains("World"));
  print(str.startsWith("Hello"));
  print(str.endsWith("World"));
  print(str.substring(0, 6) + "Dart");
  print(str.split(" "));
  print(str.trim());
  print(str.replaceAll("World", "Dart"));
  print(str.compareTo(str2));
  print(str2.compareTo(str));

  print("Enter Your key");
  String? yourkey = stdin.readLineSync();

  if (yourkey == "mariam") {
    print("Welcome mariam");
  } else if (yourkey == "ferganey") {
    print("Welcome ferganey");
  } else {
    print("You are not allowed to enter");
  }

  print("Enter Your key");
  String? yourkeyvalue = stdin.readLineSync();

  switch (yourkeyvalue) {
    case "mariam":
      print("Welcome mariam");
      break;
    case "ferganey":
      print("Welcome ferganey");
      break;
    default:
      print("You are not allowed to enter");
  }

  print("Enter your age:");
  String? input = stdin.readLineSync();
  if (input != null) {
    int age = int.parse(input);
    String messg = (age > 20) ? "You are an adult" : "You are not an adult";
    print(messg);
  } else {
    print("Invalid input.");
  }

  try {
    print("Enter your first number:");
    String? input1 = stdin.readLineSync();

    print("Enter your second number:");
    String? input2 = stdin.readLineSync();

    if (input1 != null && input2 != null) {
      int num1 = int.parse(input1);
      int num2 = int.parse(input2);
      print("Sum = ${add(num1, num2)}");
    } else {
      print("Error: One or both inputs were null.");
    }

  } catch (e) {
    print("Error: Invalid input.");
  }


  // Assertion (works only if you run with: dart run --enable-asserts)
  assert(yourkeyvalue == "mariam", "Your key is not mariam");

  for(int i = 1; i <=10; ++i){
    print("$i");
  }
}

/// This is a simple Dart func that add two numbers using /// comment for documentation
int add(a, b) {
  /*
   Multi comment
  */
  return a + b;
}
