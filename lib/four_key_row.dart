import 'package:calculator/handler.dart';
import 'package:flutter/material.dart';

import './round_button.dart';

class FourKeyRow extends StatelessWidget {
  final List<String> icons;
  final Handler handler;
  final Function updateAC;

  FourKeyRow(this.icons, this.handler, this.updateAC);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.18;
    double height = MediaQuery.of(context).size.height * 0.65 * 0.15;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundButton.number(
            width: width,
            height: height,
            icon: icons[0],
            onClick: () => handler.number(int.parse(icons[0]), updateAC),
          ),
          RoundButton.number(
            width: width,
            height: height,
            icon: icons[1],
            onClick: () => handler.number(int.parse(icons[1]), updateAC),
          ),
          RoundButton.number(
            width: width,
            height: height,
            icon: icons[2],
            onClick: () => handler.number(int.parse(icons[2]), updateAC),
          ),
          RoundButton.mathOperator(
            width: width,
            height: height,
            icon: icons[3],
            onClick: () => handler.operator(icons[3]),
          ),
        ],
      ),
    );
  }
}
