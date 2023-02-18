import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  Color backgroundColor;
  bool isUpperCase;
  double radius;
  Color borderColor;
  DefaultButton({
    super.key,
    required this.buttonWidget,
    required this.function,
    this.width = double.infinity,
    this.backgroundColor = Colors.blue,
    this.isUpperCase = true,
    this.radius = 10.0,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
