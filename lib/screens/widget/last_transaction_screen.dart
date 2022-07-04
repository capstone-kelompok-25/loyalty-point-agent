import 'package:capstone/screens/history/history_screen.dart';
import 'package:capstone/screens/widget/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LastTransactionScreen extends StatelessWidget {
  const LastTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return BottomNavigationScreen();
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                            opacity: animation.drive(tween), child: child);
                      }),
                    );
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Transaksi Sedang di Proses",
                textAlign: TextAlign.center,
               style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
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
            SizedBox(height: 40,),
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