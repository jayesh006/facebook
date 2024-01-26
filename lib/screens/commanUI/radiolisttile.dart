import 'package:flutter/material.dart';

class RadioListTiles extends StatelessWidget {
  const RadioListTiles({super.key, this.groupValue,this.onChange, this.value, this.text});

  final groupValue;
  final value;
  final text;
  final Function(dynamic)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: RadioListTile(
        title:  Text(text),
        controlAffinity: ListTileControlAffinity.trailing,
        value: value,
        groupValue: groupValue,
        onChanged: onChange,
      ),
    );
  }
}
