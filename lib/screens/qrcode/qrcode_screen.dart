import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // centerTitle: true,
        title: const Text(
          "My QR Code",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(height: 10,),
            const Text("Your Barcode ID"),
            const Text("3375124607", style: TextStyle(color: Colors.blue),),
            const SizedBox(height: 20,),
            const Card(
                  child: ListTile(
                    leading: Icon(Icons.stars_rounded),
                    title: Text('1.234.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),                    
                  ),
                ),
                SizedBox(height: 20,),
            Center(
              child: Card(
                  child: BarcodeWidget(
                barcode: Barcode.aztec(), // Barcode type and settings
                data: 'https://wa.me/+628816254736', // Content
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