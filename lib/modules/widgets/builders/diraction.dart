import 'package:flutter/material.dart';

Widget buildDirectionalDismess() => Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.centerRight,
        height: 100,
        width: double.infinity,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.delete),
        ),
      ),
    );
