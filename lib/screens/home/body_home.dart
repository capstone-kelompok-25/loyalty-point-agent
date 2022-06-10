import 'package:capstone/screens/home/header_home_screen.dart';
import 'package:capstone/screens/qrcode/qrcode_screen.dart';
import 'package:capstone/screens/transaction/transaction_view_model.dart';
import 'package:capstone/screens/widget/banner.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TransactionViewModel modelView = Provider.of<TransactionViewModel>(context);
    final _transaction = modelView.transaction;
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
                child: const ListTile(
                  leading: Icon(Icons.stars_rounded),
                  title: Text('1.234.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // subtitle: Text('5.234'),
                  trailing: Icon(Icons.qr_code_scanner, color: Colors.blue,),
                ),
              ),
            ),
            const BannerWidget(),
            const Card(
              shadowColor: Colors.black,
              child: ListTile(
                leading: Icon(Icons.payment),
                title: Text('Redeem for E-Money', style: TextStyle(fontSize: 16)),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.wallet),
                title: Text('Redeem for Cash out', style: TextStyle(fontSize: 16)),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('Redeem for Pulsa/Paket Data', style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
