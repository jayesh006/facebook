import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';

import '../../utils/colos.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {super.key,
      this.controlerName,
      this.color,
      this.text,
      this.onChange,
      this.iconOnPress,
        this.keyboardType,
        this.showIcon
      });
  final controlerName;
  final color;
  final text;
  final Function(String?)? onChange;
  final GestureTapCallback? iconOnPress;
  final keyboardType;
  final showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChange,
          controller: controlerName,
          decoration: InputDecoration(
            suffixIcon: showIcon == true ?  Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: controlerName.text.trim().isNotEmpty
                  ? IconButton(
                      onPressed: iconOnPress,
                      icon: const Icon(Icons.close),
                    )
                  : null,
            ) : null,
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: HexColor("#dcdcdc"))),
          ),
        ),
        // if()
      ],
    );
  }
}

// Login Page comman Text fields
class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      this.onChange,
      this.controlerName,
      this.hintText,
      this.obscureText});

  final Function(String?)? onChange;
  final controlerName;
  final hintText;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Material(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.transparent)),
        elevation: 10.0,
        shadowColor: Colors.white,
        child: TextField(
          obscureText: obscureText,
          onChanged: onChange,
          controller: controlerName,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            fillColor: HexColor("#e8e8e8"),
            filled: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.black)),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

// Date Picker
class DatePicker extends StatelessWidget {
  const DatePicker(
      {super.key,
      this.text,
      this.selectedDay,
      this.selectedMonth,
      this.selectedYear,
      this.onChangeDay,
      this.onChangeMonth,
      this.onChangeYear});

  final text;
  final selectedDay;
  final selectedMonth;
  final selectedYear;
  final Function(String?)? onChangeDay;
  final Function(String?)? onChangeMonth;
  final Function(String?)? onChangeYear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(text),
          DropdownDatePicker(
            locale: "en",
            inputDecoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            isDropdownHideUnderline: true,
            isFormValidator: true,
            startYear: 1900,
            endYear: selectedYear,
            // width: 5,
            selectedDay: selectedDay,
            selectedMonth: selectedMonth,
            selectedYear: selectedYear,
            onChangedDay: onChangeDay,
            onChangedMonth: onChangeMonth,
            onChangedYear: onChangeYear,
            boxDecoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0)), // optional
            dayFlex: 2,
            yearFlex: 2,
            monthFlex: 2, // optional
          ),
        ],
      ),
    );
  }
}

// Richtext widget
class RichTexts extends StatelessWidget {
  const RichTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            text:
            'People who use our service may have uploaded your contact information to Facebook. ',
            children: [
              TextSpan(
                  text: "Learn more ",
                  style: TextStyle(color: Colors.blue)),
              TextSpan(text: "By Tapping "),
              TextSpan(
                  text: "Sign Up ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              TextSpan(text: "you agree to our "),
              TextSpan(
                  text: "Terms, privacy Policy ",
                  style: TextStyle(color: Colors.blue)),
              TextSpan(text: "and "),
              TextSpan(
                  text: "Cookie Policy. ",
                  style: TextStyle(color: Colors.blue)),
              TextSpan(
                  text:
                  "You may receive SMS notification from us and can opt out at any time"),
            ]),
      ),
    );
  }
}

class ForgotPasswordTextField extends StatelessWidget {
  const ForgotPasswordTextField(
      {super.key,
        this.controlerName,
        this.text,
        this.onChange,
        this.keyboardType,

      });
  final controlerName;
  final text;
  final Function(String?)? onChange;
  final keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChange,
          controller: controlerName,
          decoration: InputDecoration(

            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 3)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: HexColor("#dcdcdc"))),
          ),
        ),
        // if()
      ],
    );
  }
}
