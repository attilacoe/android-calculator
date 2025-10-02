import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _expression = "";
  String _result = "";

  void _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _expression = "";
        _result = "";
      } else if (value == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _result = eval.toString();
        } catch (e) {
          _result = "Error";
        }
      } else {
        _expression += value;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onPressed(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _expression,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _result,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("/")]),
              Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("*")]),
              Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("-")]),
              Row(children: [_buildButton("0"), _buildButton("."), _buildButton("="), _buildButton("+")]),
              Row(children: [_buildButton("C")]),
            ],
          )
        ],
      ),
    );
  }
}
