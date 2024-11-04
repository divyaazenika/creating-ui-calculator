import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '0'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
            // Baris tombol kalkulator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('C'),
                _buildButton('+/-'),
                _buildButton('%'),
                _buildButton('/', isOperation: true), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('*', isOperation: true), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('-', isOperation: true), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('1'),
                _buildButton('2'), 
                _buildButton('3'), 
                _buildButton('+', isOperation: true), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('0', flex: 2), 
                _buildButton(',', isOperation: true),
                _buildButton('=', isOperation: true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, {bool isOperation = false, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (label == 'C') {
              display = '0'; 
            } else if (label == '=') {
            } else {
              if (display == '0') {
                display = label; 
              } else {
                display += label; 
              }
            }
          });
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(70, 70),   
          backgroundColor: isOperation ? Colors.orange : (Colors.grey[800] ?? Colors.grey),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
