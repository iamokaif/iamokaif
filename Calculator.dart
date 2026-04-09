import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        num1 = double.parse(display);
        operator = value;
        display = "0";
      } else if (value == "=") {
        num2 = double.parse(display);

        if (operator == "+") {
          display = (num1 + num2).toString();
        } else if (operator == "-") {
          display = (num1 - num2).toString();
        } else if (operator == "*") {
          display = (num1 * num2).toString();
        } else if (operator == "/") {
          if (num2 == 0) {
            display = "Error";
          } else {
            display = (num1 / num2).toString();
          }
        }
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget buildButton(String text, {Color color = Colors.grey}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Display
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              display,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(),

          // Buttons
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0"),
                    buildButton("C", color: Colors.red),
                    buildButton("=", color: Colors.green),
                    buildButton("+", color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
