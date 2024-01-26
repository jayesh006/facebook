import 'package:facebook/screens/commanUI/textfield.dart';
import 'package:flutter/material.dart';

import '../utils/colos.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  var emailMobile = 'mobile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text("facebook",
                    style: TextStyle(
                        color: HexColor("#1877f2"),
                        fontWeight: FontWeight.bold,
                        fontSize: 25))),
            const Divider(),
             ForgotPasswordTextField(
              text: emailMobile == 'email' ? "Enter your email address or full name" : "Enter your mobile number",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: HexColor("#1877f2"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onPressed: () {},
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      emailMobile = emailMobile ==  'email' ? 'mobile' : 'email';
                    });
                  },
                    child: const Text(
              "Search by your email address or name instead",
              style: TextStyle(color: Colors.blueAccent),
            )))
          ],
        ),
      ),
    ));
  }
}
