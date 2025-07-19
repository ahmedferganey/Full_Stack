import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/pizza-512x512.png', // ✅ Local asset image
                height: 40,
              ),
              const SizedBox(width: 12),
              const Text(
                "Pizza Nor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView( // ✅ Makes all content scrollable
          child: Column(
            children: [
              Container(
                width: 300,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  border: Border.all(
                    color: Colors.deepOrange,
                    width: 7.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                      offset: Offset(10, 10),
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 8,
                      offset: Offset(-10, -10),
                      spreadRadius: 2,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Welcome to Pizza Nor!",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  "Choose your toppings:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap( // ✅ Shows a responsive group of elements
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(50, (index) {
                    return Chip(
                      label: Text("Topping ${index + 1}"),
                      backgroundColor: Colors.orange.shade200,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "🍕 Pizza made with love!",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
