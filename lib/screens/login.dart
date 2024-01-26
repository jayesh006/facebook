import 'dart:convert';

import 'package:facebook/screens/commanUI/button.dart';
import 'package:facebook/screens/commanUI/errormessgae.dart';
import 'package:facebook/screens/commanUI/text.dart';
import 'package:facebook/screens/commanUI/textfield.dart';
import 'package:facebook/screens/forgotpassword.dart';
import 'package:facebook/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colos.dart';
import '../utils/pattern.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  var showFieldError = {"userName": false, "password": false};
  var dataFromStorage;
  final Patterns patterns = Patterns();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      read('userData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                "facebook",
                style: TextStyle(
                    color: HexColor("#1877f2"),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
              const SizedBox(
                height: 20,
              ),
              LoginTextField(
                onChange: (e) {
                  setState(() {});
                },
                controlerName: userName,
                hintText: "Mobile number or email address",
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextField(
                controlerName: password,
                hintText: "Password",
                obscureText: true,
              ),
              ErrorMessage(
                visible: showFieldError['userName'] == true,
                showText:
                    "The email address or phone number that you've entered doesn't match any account. Sign up for an account",
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              const SizedBox(
                height: 20,
              ),
              LogIn(
                onPress: buttonOnpress,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()),
                    );
                  },
                  child: Text(
                    "Forgotten password?",
                    style: TextStyle(
                        color: HexColor("#1877f2"),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Row(children: [
                  Expanded(child: Divider()),
                  Padding(padding: EdgeInsets.all(10), child: Text("OR")),
                  Expanded(child: Divider()),
                ]),
              ),
              Center(
                child: CreateNew(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registration()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Column(
                    children: [
                      LanguageText(text: "English"),
                      LanguageText(text: 'हिंदी'),
                      LanguageText(text: 'मराठी'),
                      LanguageText(text: 'ਪੰਜਾਬੀ'),
                      LanguageText(text: ''),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const LanguageText(text: 'తెలుగు'),
                      const LanguageText(text: 'ગુજરાતી'),
                      const LanguageText(text: 'عربي'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_box_outlined,
                            size: 15,
                          ))
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text("Meta \u00a9 2024"),
              )
            ],
          ),
        ),
      ),
    );
  }

  buttonOnpress() {
    {
      // print(userName.text);
      // print(password.text);

      if (!userName.text.trim().isEmpty && !password.text.trim().isEmpty) {
        var type;
        if (userName.text.contains("@") && userName.text.contains("@")) {
          type = 'emailAddress';
        } else {
          type = 'mobileNumber';
        }

        setState(() {
          showFieldError['userName'] = false;

          // print(type);
          forData(type).then((value) {
            if (value == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Logged In"),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                    "Email address or mobile number and password is incorrect."),
              ));
            }
          });
        });
      } else {
        setState(() {
          showFieldError['userName'] = true;
        });
      }

      // read('userData');
    }
  }

  Future forData(type) async {
    var counter = 0;
    for (var data in dataFromStorage) {
      if (data[type] == userName.text && data["password"] == password.text) {
        return true;
      }
    }
    print(type);
    return false;
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print(json.decode(prefs.getString(key)!));
    dataFromStorage = json.decode(prefs.getString(key)!);
    return json.decode(prefs.getString(key)!);
  }
}
