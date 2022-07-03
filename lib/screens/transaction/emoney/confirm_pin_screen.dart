import 'package:capstone/screens/widget/last_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ConfirmPinScreenEMoney extends StatefulWidget {
  const ConfirmPinScreenEMoney({Key? key}) : super(key: key);

  @override
  State<ConfirmPinScreenEMoney> createState() => _ConfirmPinScreenEMoneyState();
}

class _ConfirmPinScreenEMoneyState extends State<ConfirmPinScreenEMoney> {
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
        title: Text("E-Money",
        style: TextStyle(fontSize: 17),),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            PinCodeTextField(
              autofocus: false,
              controller: _pinController,
              maxLength: 6,
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