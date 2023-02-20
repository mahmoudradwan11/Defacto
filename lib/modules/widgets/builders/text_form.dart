import 'package:flutter/material.dart';

Widget buildTextForm(
    BuildContext context,
    double height, {
      TextEditingController? buttonController,
      double? width,
      String? title,
      double? fontSize = 16.0,
      Color? color = Colors.black,
    }) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: fontSize, color: color),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1.0),
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: buttonController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
