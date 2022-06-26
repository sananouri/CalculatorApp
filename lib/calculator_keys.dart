import 'package:calculator/handler.dart';
import 'package:flutter/material.dart';

import './four_key_row.dart';
import './round_button.dart';

class CalculatorKeys extends StatefulWidget {
  final Handler handler;

  CalculatorKeys(this.handler);

  @override
  _CalculatorKeysState createState() => _CalculatorKeysState();
}

class _CalculatorKeysState extends State<CalculatorKeys> {
  String acIcon = 'AC';

  _setACIcon(String icon) {
    setState(() {
      acIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.65;

    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundButton.operator(
                width: width * 0.4,
                height: height * 0.15,
                icon: acIcon,
                onClick: () => widget.handler.ac(_setACIcon),
              ),
              RoundButton.operator(
                width: width * 0.4,
                height: height * 0.15,
                icon: '=',
                onClick: widget.handler.equal,
              )
            ],
          ),
          FourKeyRow(['7', '8', '9', '/'], widget.handler, _setACIcon),
          FourKeyRow(['4', '5', '6', '*'], widget.handler, _setACIcon),
          FourKeyRow(['1', '2', '3', '+'], widget.handler, _setACIcon),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundButton.number(
                width: width * 0.18,
                height: height * 0.15,
                icon: '0',
                onClick: () => widget.handler.number(0, _setACIcon),
              ),
              RoundButton.operator(
                width: width * 0.4,
                height: height * 0.15,
                icon: '.',
                onClick: widget.handler.point,
              ),
              RoundButton.mathOperator(
                width: width * 0.18,
                height: height * 0.15,
                icon: '-',
                onClick: () => widget.handler.operator('-'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum Keys { number, point, ac, equal, divide, multiply, add, subtract }
