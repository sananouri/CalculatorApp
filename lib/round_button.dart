import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double height, width;
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final int ratio;
  final Function onClick;

  RoundButton.number({
    this.width = 75,
    this.height = 75,
    this.icon = '1',
    this.backgroundColor = const Color(0xff626365),
    this.iconColor = Colors.white,
    this.ratio = 1,
    required this.onClick,
  });

  RoundButton.mathOperator(
      {this.width = 75,
      this.height = 75,
      this.icon = '+',
      this.backgroundColor = const Color(0xffea8657),
      this.iconColor = Colors.white,
      this.ratio = 1,
      required this.onClick});

  RoundButton.operator(
      {this.width = 75,
      this.height = 75,
      this.icon = 'AC',
      this.backgroundColor = const Color(0xffa5a8ac),
      this.iconColor = Colors.black,
      this.ratio = 2,
      required this.onClick});

  RoundButton(
      {this.width = 75,
      this.height = 75,
      this.icon = '1',
      this.backgroundColor = const Color(0xff626365),
      this.iconColor = Colors.white,
      this.ratio = 1,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () => onClick(),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height - 1),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          icon,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              color: iconColor),
        ),
      ),
    );
  }
}
