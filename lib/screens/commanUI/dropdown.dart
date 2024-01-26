import 'package:flutter/material.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key, this.color, this.selectedValue, this.onChange});

  final color;
  final selectedValue;

  final Function(Object?)? onChange;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: color),
              borderRadius: const BorderRadius.all(
                  Radius.circular(4.0)))),
      child: DropdownButton(
          value: selectedValue,
          hint: Text("Select your pronoun"),
          isDense: true,
          isExpanded: true,
          // underline: null,
          items: const [
            DropdownMenuItem(
              value: "she",
              child: Text(
                  "She: \"Wish her a happy birthday!\""),
            ),
            DropdownMenuItem(
              value: "he",
              child: Text(
                  "He:\"Wish him a happy birthday!\""),
            ),
            DropdownMenuItem(
              value: "them",
              child: Text(
                  "They:\"Wish them a happy birthday!\""),
            ),
          ],
          onChanged: onChange,
      ),
    );
  }
}
