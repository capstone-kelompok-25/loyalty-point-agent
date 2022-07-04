import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LastTransactionScreen extends StatelessWidget {
  const LastTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Transaksi Sedang di Proses",
                textAlign: TextAlign.center,
               style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(
              height: 10
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Silahkan Cek History Secara Berkala",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("assets/img/State7.png"),
            const Spacer(
              flex: 8,
            ),
          ]
    ),
      )
    );
  }
}