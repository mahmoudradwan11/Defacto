import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.white,
        height: 10.0,
        width: double.infinity,
      ),
    );
  }
}
