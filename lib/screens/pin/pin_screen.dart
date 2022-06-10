import 'package:capstone/screens/login/login_screen.dart';
import 'package:capstone/screens/pin/header_pin_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderPinScreen(size: size),
                const SizedBox(
                  height: 60,
                ),
                PinCodeTextField(
                autofocus: false,
                controller: _textEditingController,
                maxLength: 6,
                highlight: false,
                hasUnderline: true,
                hideCharacter: true,
                hasTextBorderColor: Colors.grey,
                pinBoxColor: Colors.transparent,
                // highlightPinBoxColor: Colors.grey,
                onDone: (text) {
                  print(_textEditingController.text);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const LoginScreen();
                  }));
                },
                // highlightColor: Colors.grey,
                // defaultBorderColor: Colors.black,
                maskCharacter: "*",
                ),
              ],
            ),
          ),
    );
  }
}
