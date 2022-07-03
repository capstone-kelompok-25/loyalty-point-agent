import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:provider/provider.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String ids = "";
  String poins = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String id = await sharedPref.read("id");
    String poin = await sharedPref.read("poin");
    setState(() {
      ids = id.replaceAll('"', '');
      poins = poin.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value) {
      print(value);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          "My QR Code",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
      ),
      body: Container(
        // width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(height: 10,),
            Text("Your Barcode ID"),
            Text(ids, style: TextStyle(color: Colors.blue),),
            const SizedBox(height: 20,),
            Card(
                  child: ListTile(
                    leading: Icon(Icons.stars_rounded),
                    title: Text(poins, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),                    
                  ),
                ),
                SizedBox(height: 20,),
            Center(
              child: Card(
                  child: BarcodeWidget(
                barcode: Barcode.aztec(), // Barcode type and settings
                data: ids, // Content
                width: 200,
                height: 200,
              )),
            ),
            const SizedBox(height: 20,),
             const Center(
                child: Text('Tunjukkan QR Code ini saat belanja agar mendapat poin', style: TextStyle(fontSize: 16))),
          ]
        ),
      ),
    );
  }
}