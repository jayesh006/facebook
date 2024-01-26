import 'package:facebook/utils/colos.dart';
import 'package:flutter/material.dart';
class GenerateText extends StatelessWidget {
  const GenerateText({super.key, this.text});
final text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),);
  }
}

class SecondText extends StatelessWidget {
  const SecondText({super.key, this.text});
final text;
  @override
  Widget build(BuildContext context) {
    return Text(text,softWrap: true,);
  }
}

class LanguageText extends StatelessWidget {
  const LanguageText({super.key, this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: HexColor("#576b95")),);
  }
}


