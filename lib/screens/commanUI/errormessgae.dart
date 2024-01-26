import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, this.showText, this.visible, this.width});
  final showText;
  final visible;
  final width;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
        child: Container(
      width: width,
      color: Colors.red,
      child:  Text(
        showText,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }
}
