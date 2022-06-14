import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/home/header_home_screen.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/qrcode/qrcode_screen.dart';
import 'package:capstone/screens/widget/banner.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    final userItem = Result();
    final user = modelView.profile.isNotEmpty ? modelView.profile[modelView.profile.length - 1] : userItem;
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderHomeScreen(size: size),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScreen()));
                } ,
                child: ListTile(
                  leading: Image.asset("assets/img/coin.png"),
                  title: Text('${user.poin}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // subtitle: Text('5.234'),
                  trailing: Icon(Icons.qr_code_scanner, color: Colors.blue,),
                ),
              ),
            ),
            const BannerWidget(),
            const Card(
              shadowColor: Colors.black,
              child: ListTile(
                leading: Icon(Icons.payment, color: Color.fromARGB(255, 75, 75, 75),),
                title: Text('Redeem for E-Money', style: TextStyle(fontSize: 16, color: textColor)),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.wallet, color: Color.fromARGB(255, 75, 75, 75)),
                title: Text('Redeem for Cash out', style: TextStyle(fontSize: 16, color: textColor)),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone_android, color: Color.fromARGB(255, 75, 75, 75)),
                title: Text('Redeem for Pulsa/Paket Data', style: TextStyle(fontSize: 16, color: textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
