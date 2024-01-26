import 'package:flutter/material.dart';

import '../../utils/colos.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        color: Colors.white,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Do you want to stop creating your account?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "If you stop now, you'll lose any progress that you've made.",
                style: TextStyle(
                    color: HexColor('#a3a3a3'),
                    fontWeight: FontWeight.w400),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Countinue creating account",
                        style: TextStyle(
                            color: HexColor('#a3a3a3'),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Stop creating account",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
