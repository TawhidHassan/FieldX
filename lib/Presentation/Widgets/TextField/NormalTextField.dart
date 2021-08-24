// ignore_for_file: file_names

import 'package:fieldx/Constants/Colors/constants.dart';
import 'package:flutter/material.dart';

import 'TextFieldContainer.dart';


class NormalInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const NormalInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Id or Email';
        }
        return null;
      },
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
        errorStyle: TextStyle(color: Colors.white),
      ),
    ));
  }
}
