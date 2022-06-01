import 'package:capstone/screens/login/login_screen.dart';
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
    return Scaffold(
          body: Center(
        child: PinCodeTextField(
          autofocus: true,
          controller: _textEditingController,
          maxLength: 6,
          highlight: true,
          hasUnderline: false,
          hideCharacter: true,
          pinBoxColor: Colors.grey,
          highlightPinBoxColor: Colors.grey[800],
          onDone: (text) {
            print(_textEditingController.text);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return const LoginScreen();
            }));
          },
          highlightColor: Colors.blueGrey,
          defaultBorderColor: Colors.black,
          maskCharacter: "*",
        ),
      ),
    );
  }
}
