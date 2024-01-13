import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GKM Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GKM Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "x") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: OutlinedButton(
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () => buttonPressed(buttonText),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 12.0),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x")
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ],
              ),
              Row(
                children: [buildButton("CLEAR"), buildButton("=")],
              )
            ],
          )
        ]),
      ),
    );
  }
}
