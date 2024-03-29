import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function()?  onPressed;
  const MyTextButton({
    required this.text,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text.toUpperCase()), );
  }
}
