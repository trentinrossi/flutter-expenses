import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeField extends StatelessWidget {
  final String label;
  final Function() onSubmitted;
  final TextEditingController controller;
  final TextInputType inputType;

  const AdaptativeField({
    super.key,
    required this.label,
    required this.onSubmitted,
    required this.controller,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            keyboardType: inputType,
            controller: controller,
            onSubmitted: (value) => onSubmitted,
            placeholder: label,
            maxLength: 100,
          )
        : TextField(
            keyboardType: inputType,
            controller: controller,
            onSubmitted: (value) => onSubmitted,
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
            maxLength: 100,
          );
  }
}
