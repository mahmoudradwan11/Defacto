import 'package:flutter/material.dart';

Widget defaultFieldForm({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  String? label,
  String? hint,
  IconData? prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
  var hintStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        // borderRadius: BorderRadius.circular(30
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPress,
                color: Colors.black,
              )
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );
