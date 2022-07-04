import 'package:capstone/screens/widget/last_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ConfirmPinScreenPulse extends StatefulWidget {
  const ConfirmPinScreenPulse({Key? key}) : super(key: key);

  @override
  State<ConfirmPinScreenPulse> createState() => _ConfirmPinScreenPulseState();
}

class _ConfirmPinScreenPulseState extends State<ConfirmPinScreenPulse> {
  final _pinController = TextEditingController();
  String pin = '';

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pinController.addListener(() {
      setState(() {
        pin = _pinController.text;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Isi Pulsa",
        style: TextStyle(fontSize: 17),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Text("Masukkan PIN", style: TextStyle(fontSize: 16)),
              SizedBox(height:20),
            PinCodeTextField(
              autofocus: false,
              controller: _pinController,
              maxLength: 4,
              highlight: false,
              hasUnderline: true,
              // hideCharacter: true,
              hasTextBorderColor: Colors.transparent,
              pinBoxColor: Colors.transparent,
              // highlightPinBoxColor: Colors.grey,
              onDone: (text) => getPIN()
              // highlightColor: Colors.grey,
              // defaultBorderColor: Colors.black,
              // maskCharacter: "*",
            ),
          ],
        ),
      ),
    );
  }
  getPIN() async {
    pin = _pinController.text;

    if (pin == true) {
      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const LastTransactionScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );
    } else {
      print("error");
      final snackBar = SnackBar(
        content: Text("Pin yang Anda Masukkan Salah"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}