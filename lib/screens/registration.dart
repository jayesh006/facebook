import 'dart:convert';

import 'package:facebook/screens/commanUI/alertbox.dart';
import 'package:facebook/screens/commanUI/button.dart';
import 'package:facebook/screens/commanUI/dropdown.dart';
import 'package:facebook/screens/commanUI/errormessgae.dart';
import 'package:facebook/screens/commanUI/radiolisttile.dart';
import 'package:facebook/screens/commanUI/text.dart';
import 'package:facebook/screens/commanUI/textfield.dart';
import 'package:facebook/utils/colos.dart';
import 'package:facebook/utils/pattern.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController firstName = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  var emailaddress = TextEditingController();
  TextEditingController enterGender = TextEditingController();
  TextEditingController passowrd = TextEditingController();
  var gender = null;

  var showContainer = {
    "name": true,
    "date": false,
    "mobile": false,
    "gender": false,
    "password": false,
  };

  var showFieldError = {
    "firstName": false,
    "surName": false,
    "date": false,
    "mobileNumber": false,
    "emailAddress": false,
    "gender": false,
    "pronoun": false,
    "password": false
  };

  int _selectedDay = 25;
  int _selectedMonth = 01;
  int _selectedYear = 2024;

  var showMobileEmail = 'mobile';
  var selectedValue = null;

  var dataFromStorage = null;
  List strings = [];
  var showHideAlert = false;

  final Patterns patterns = Patterns();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    setState(() {
      _selectedYear = date.year.toInt();
      read('userData');
    });
    print(date.year);
  }

  DateTime? _dateTime(int? day, int? month, int? year) {
    if (day != null && month != null && year != null) {
      return DateTime(year, month, day);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: HexColor("#1877f2"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            if (showContainer['name'] == true) showAlertBox();
            // Navigator.pop(context);
            setState(() {
              print("object");
              if (showContainer['date'] == true) {
                showContainer['date'] = false;
                showContainer['name'] = true;
              }
              if (showContainer['mobile'] == true) {
                showContainer['mobile'] = false;
                showContainer['date'] = true;
              }

              if (showContainer['gender'] == true) {
                showContainer['gender'] = false;
                showContainer['mobile'] = true;
              }

              if (showContainer['password'] == true) {
                showContainer['password'] = false;
                showContainer['gender'] = true;
              }
            });
          },
        ),
        title: const Center(
          child: Text(
            "Join Facebook",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Name Form
            Visibility(
              visible: showContainer['name'] == true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const GenerateText(
                      text: "What's yous name?",
                    ),
                    const SecondText(
                        text: "Enter the name you use in real life."),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            // color: Colors.red,
                            child: TextFields(
                              text: "First name",
                              controlerName: firstName,
                              iconOnPress: () {
                                setState(() {
                                  firstName.text = "";
                                });
                              },
                              onChange: (e) {
                                setState(() {});
                              },
                              showIcon: true,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            // color: Colors.green,
                            child: TextFields(
                              text: "Surname",
                              controlerName: surName,
                              iconOnPress: () {
                                setState(() {
                                  surName.text = "";
                                });
                              },
                              showIcon: true,
                              onChange: (e) {
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    ErrorMessage(
                      visible: showFieldError['firstName'] == true,
                      showText: "What's your name?",
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    ErrorMessage(
                      visible: showFieldError['surName'] == true,
                      showText: "Please enter your surname",
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GenerateButton(
                      onPress: nameFormNextClick,
                      buttonLabel: "Next",
                    ),
                  ],
                ),
              ),
            ),

            //   Date Form
            Visibility(
              visible: showContainer['date'] == true,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const GenerateText(text: "What's your date of birth?"),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: SecondText(
                      text:
                          "Choose your date of birth. You can always make this private later.",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DatePicker(
                    text: "Date of birth",
                    selectedYear: _selectedYear,
                    selectedMonth: _selectedMonth,
                    selectedDay: _selectedDay,
                    onChangeDay: (value) {
                      setState(() {
                        _selectedDay = int.parse(value!);
                      });
                      // print('onChangedDay: $value');
                    },
                    onChangeMonth: (value) {
                      setState(() {
                        _selectedMonth = int.parse(value!);
                      });
                      // print('onChangedMonth: $value');
                    },
                    onChangeYear: (value) {
                      setState(() {
                        _selectedYear = int.parse(value!);
                      });
                      // print('onChangedYear: $value');
                    },
                  ),
                  ErrorMessage(
                    visible: showFieldError['date'] == true,
                    width: MediaQuery.of(context).size.width * 0.9,
                    showText:
                        "It looks like you've entered the wrong info. Please make sure that you use your real date of birth",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GenerateButton(
                    onPress: dateFormClick,
                    buttonLabel: "Next",
                  )
                ],
              ),
            ),

            //   Mobile Number Form
            Visibility(
              visible: showContainer['mobile'] == true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const GenerateText(
                    text: "Enter your phone number",
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 15, 10),
                    child: SecondText(
                      text:
                          "Enter mobile number on which you can be contacted. You can hide this from your profile later.",
                    ),
                  ),

                  // Mobile number container
                  if (showMobileEmail == 'mobile')
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFields(
                        text: "Phone number",
                        controlerName: mobileNumber,
                        keyboardType: TextInputType.phone,
                        showIcon: true,
                      ),
                    ),

                  // Email Container
                  Visibility(
                    visible: showMobileEmail == 'email' ? true : false,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFields(
                        text: "Email address",
                        controlerName: emailaddress,
                        keyboardType: TextInputType.emailAddress,
                        showIcon: false,
                      ),
                    ),
                  ),

                  ErrorMessage(
                    visible: showFieldError['mobileNumber'] == true,
                    showText: "Please enter a valid mobile number",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  ErrorMessage(
                    visible: showFieldError['emailAddress'] == true,
                    showText: "Please enter a valid email address.",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  GenerateButton(
                    onPress: mobileNumberFormClick,
                    buttonLabel: "Next",
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      child: const Text("Sign up using email address"),
                      onTap: signupEmailTextClick,
                    ),
                  ),
                ],
              ),
            ),

            //   Gender form
            Visibility(
              visible: showContainer['gender'] == true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const GenerateText(
                      text: "What's your gender?",
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: SecondText(
                        text:
                            "You can change who see your gender on your profile later.",
                      ),
                    ),
                    ErrorMessage(
                      visible: showFieldError['gender'] == true,
                      showText: "Please select your gender.",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    ErrorMessage(
                      visible: showFieldError['pronoun'] == true,
                      showText: "Please select your pronoun.",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    RadioListTiles(
                      onChange: (value) {
                        setState(() {
                          showFieldError['gender'] = false;
                          gender = value;
                        });
                      },
                      value: "females",
                      text: 'Female',
                      groupValue: gender,
                    ),
                    RadioListTiles(
                      onChange: (value) {
                        setState(() {
                          showFieldError['gender'] = false;
                          gender = value;
                        });
                      },
                      text: 'Male',
                      value: "males",
                      groupValue: gender,
                    ),
                    RadioListTiles(
                      onChange: (value) {
                        setState(() {
                          showFieldError['gender'] = false;
                          gender = value;
                        });
                      },
                      value: "Custome",
                      text: 'Custome',
                      groupValue: gender,
                    ),
                    if (gender != 'Custome')
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: SecondText(
                            text:
                                "Select Cusom to choose another gender, or if you'd rather not say."),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (gender == 'Custome')
                      Visibility(
                        visible: true,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "Your pronoun is visible to everyone."),
                              Dropdowns(
                                color: HexColor("#dcdcdc"),
                                onChange: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                    print(selectedValue);
                                  });
                                },
                                selectedValue: selectedValue,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFields(
                                text: "Enter your gender(optional)",
                                onChange: (e) {
                                  setState(() {});
                                },
                                controlerName: enterGender,
                                showIcon: true,
                                iconOnPress: () {
                                  setState(() {
                                    enterGender.text = "";
                                  });
                                },
                                // color: ,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    GenerateButton(
                      onPress: genderFromClick,
                      buttonLabel: "Next",
                      // backgroundColor: HexColor("#1877f2"),
                    )
                  ],
                ),
              ),
            ),

            //   Password
            Visibility(
              visible: showContainer['password'] == true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const GenerateText(
                      text: "Choose a password",
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: SecondText(
                        text:
                            "Create a password with at least 6 character. It should be something that other couldn't guess.",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFields(
                        text: "New password",
                        controlerName: passowrd,
                      ),
                    ),
                    ErrorMessage(
                      visible: showFieldError['password'] == true,
                      showText:
                          "Enter a combination of at least six number, letter and punctuation marks (such as ! and &).",
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const RichTexts(),
                    const SizedBox(
                      height: 20,
                    ),
                    GenerateButton(
                      onPress: submitdata,
                      buttonLabel: "Sign Up",
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Already have an account?"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  nameFormNextClick() {
    setState(() {
      if (firstName.text.trim().length == 0) {
        showFieldError['firstName'] = true;
        return;
      } else {
        showFieldError['firstName'] = false;
        // return;
      }
      if (surName.text.trim().length == 0) {
        showFieldError['surName'] = true;
        return;
      } else {
        showFieldError['surName'] = false;
      }

      showContainer['name'] = false;
      showContainer['date'] = true;
    });

    print("First Name" + firstName.text);
    print("Sur Name" + surName.text);
  }

  dateFormClick() {
    DateTime? date = _dateTime(_selectedDay, _selectedMonth, _selectedYear);
    DateTime now = DateTime.now();
    DateTime dates = DateTime(now.year, now.month, now.day);
    print(_selectedYear.toString() +
        "-" +
        _selectedMonth.toString() +
        "-" +
        _selectedDay.toString());
    setState(() {
      if (_selectedYear >= (dates.year - 5)) {
        showFieldError['date'] = true;
      } else {
        showFieldError['date'] = false;
        showContainer['date'] = false;
        showContainer['mobile'] = true;
      }
    });
  }

  mobileNumberFormClick() {
    setState(() {
      print(mobileNumber.text);
      print(emailaddress.text);
      //   condition for mobile validation error
      if (showMobileEmail == 'mobile') {
        if (mobileNumber.text.trim().isEmpty ||
            !patterns.mobileNumber.hasMatch(mobileNumber.text)) {
          showFieldError['mobileNumber'] = true;
        } else {
          showFieldError['mobileNumber'] = false;
          showContainer['mobile'] = false;
          showContainer['gender'] = true;
        }
      }

      // condition for email validation error
      if (showMobileEmail == 'email') {
        if (emailaddress.text.trim().isEmpty ||
            !patterns.emailAddress.hasMatch(emailaddress.text)) {
          showFieldError['emailAddress'] = true;
        } else {
          showFieldError['emailAddress'] = false;
          showContainer['mobile'] = false;
          showContainer['gender'] = true;
        }
      }
    });
  }

  signupEmailTextClick() {
    setState(() {
      // showMobileEmail = showMobileEmail == 'mobile' ? 'email' : 'mobile';
      if (showMobileEmail == 'mobile') {
        showMobileEmail = 'email';
        showFieldError['emailAddress'] = false;
        showFieldError['mobileNumber'] = false;
        mobileNumber.text = "";
        emailaddress.text = "";
      } else {
        showMobileEmail = 'mobile';
        showFieldError['mobileNumber'] = false;
        showFieldError['emailAddress'] = false;
        mobileNumber.text = "";
        emailaddress.text = "";
      }
    });
  }

  genderFromClick() {
    setState(() {
      print(gender);
      print(enterGender.text);
      print(selectedValue);
      if (gender == null) {
        showFieldError['gender'] = true;
      } else {
        showFieldError['gender'] = false;
        if (selectedValue == null && gender == 'Custome') {
          showFieldError['pronoun'] = true;
        } else {
          showFieldError['pronoun'] = false;
          showContainer['gender'] = false;
          showContainer['password'] = true;
        }
      }
    });
  }

  submitdata() {
    setState(() {
      if (passowrd.text.trim().length == 0 ||
          !patterns.passowrd.hasMatch(passowrd.text)) {
        showFieldError['password'] = true;
      } else {
        showFieldError['password'] = false;

        Map data = {
          "firstName": firstName.text,
          "surName": surName.text,
          "dob": "$_selectedDay-$_selectedMonth-$_selectedYear",
          "mobileNumber": mobileNumber.text,
          "emailAddress": emailaddress.text.toString(),
          "gender": gender,
          "pronoun": selectedValue,
          "optionalGender": enterGender.text,
          "password": passowrd.text
        };

        print(dataFromStorage);

        if (dataFromStorage != null && dataFromStorage.length > 0) {
          print(dataFromStorage.length);
          print(dataFromStorage);
          strings = dataFromStorage;
          strings.insert(dataFromStorage.length, data);
          print(strings);
          save('userData', strings);
        } else {
          strings.add(data);
          save('userData', strings);
        }

        print("Data : " + read('userData').toString());
      }
    });
  }

  showAlertBox() {
    showDialog(
        context: context,
        barrierDismissible: showHideAlert,
        builder: (BuildContext context) {
          return AlertBox();
        });
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    print("Hete" + value.toString());
    return prefs.setString(key, json.encode(value)).then((value) {
      if (value == true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Sign up successfully"),
        ));
        Navigator.pop(context);
      }
    });
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print(json.decode(prefs.getString(key)!));
    dataFromStorage = json.decode(prefs.getString(key)!);

    return json.decode(prefs.getString(key)!);
  }
}
