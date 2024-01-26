import 'package:flutter/material.dart';

import '../../utils/colos.dart';
class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key, required this.onPress, this.buttonLabel});
  final GestureTapCallback onPress;
  final buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress,style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      side: BorderSide(
        color: HexColor("#dcdcdc"),
      ),
      backgroundColor: HexColor("#1877f2"),
    ),
      child:  Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Text(
          buttonLabel,
          style: const TextStyle(
              color: Colors.white ,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),);
  }
}


class LogIn extends StatelessWidget {
  const LogIn({super.key, this.onPress});

  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: HexColor("#1877f2"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
        ),
        child: const Text(
          "Log In",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
    );
  }
}


class CreateNew extends StatelessWidget {
  const CreateNew({super.key, this.onPress});

  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        side: BorderSide(
          color: HexColor("#dcdcdc"),
        ),
        backgroundColor: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Text(
          "Create new account",
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

