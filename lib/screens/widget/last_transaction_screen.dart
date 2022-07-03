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
            const Spacer(
              flex: 10,
            ),
            const Icon(Icons.check_circle, size: 20, color: Colors.green),
            // SvgPicture.asset("assets/icons/order_accepted_icon.svg"),
            const Spacer(
              flex: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Transaksi Sedang di Proses",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Silahkan Cek History Secara Berkala",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.w600),
              ),
            ),

            const Spacer(
              flex: 8,
            ),
            Center(
                child: Image.asset("assets/img/State7.png")),
            const Spacer(
              flex: 2,
            ),
          ]
    ),
      )
    );
  }
}