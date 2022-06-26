import 'package:calculator/handler.dart';
import 'package:flutter/material.dart';

import './calculator_keys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '0';

  void _setResult(String text) {
    setState(() {
      _result = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.02),
            alignment: Alignment.centerRight,
            child: Text(
              _result,
              style: TextStyle(color: Colors.white, fontSize: height * 0.1),
              textAlign: TextAlign.start,
            ),
          ),
          CalculatorKeys(Handler(_setResult)),
        ],
      ),
    );
  }
}
