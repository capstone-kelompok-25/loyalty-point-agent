import 'package:capstone/screens/transaction/pulsa/confirm_pin_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailTransactionPulseScreen extends StatelessWidget {
  const DetailTransactionPulseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.green,
    minimumSize: const Size(40, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Detail Transaction",
            style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
          child: Column(
            children: [
             Card(
                child:
                    Container(
                      padding:
              const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 20),
                  Center(
                        child: Text('Detail Isi Pulsa',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(height: 10),
                  // Center(
                  //     child: Text('29 MEI 2022 03.00 WIB',
                  //         style: TextStyle(color: Colors.grey,fontSize: 12))),
                  SizedBox(height: 20),
                  Text('Transaksi Berlangsung',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 20),
                  Column(
                      children: [
                        Wrap(
                          spacing: 200,
                          runSpacing: 200,
                          children: const [
                          Text('Paket Data', 
                              style: TextStyle( 
                                  fontSize: 16)),
                            
                          Text('Telkomsel - 15GB',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Wrap(
                          spacing: 200,
                          runSpacing: 200,
                          children: const [
                          Text('Nomor Ponsel', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Text('081288812345',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                      ],
                  ),
                  SizedBox(height: 30),
                  Text('POIN',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Wrap(
                          spacing: 240,
                          runSpacing: 240,
                          children: const [
                          Text('POIN Kamu', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('1.234.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Wrap(
                          spacing: 160,
                          runSpacing: 160,
                          children: const [
                          Text('Total Poin yang ditukar', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Text('50.000',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Wrap(
                          spacing: 250,
                          runSpacing: 250,
                          children: const [
                          Text('Sisa POIN', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('1.184.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                      ],
                  ),
                ]),
                    ),
              ),
              ListTile(trailing: ElevatedButton(style: raisedButtonStyle ,onPressed: (){
                Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ConfirmPinScreenPulse();
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
              }, child: Text("Redeem")))
            ],
          ),
        ));
  }
}
