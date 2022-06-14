import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),
              Center(
                  child: Text('Berhasil',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Center(
                  child: Text('29 MEI 2022 03.00 WIB',
                      style: TextStyle(color: Colors.grey,fontSize: 12))),
              SizedBox(height: 20),
              Text('Detail Transaksi',
                  style: TextStyle(color: Colors.blue, fontSize: 16)),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(children: const [
                    Text('ID Transaksi  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('   3375124607',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ]),
                  Row(children: const [
                    Text('Jenis Transaksi  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   Cash Out',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                  Row(children: const [
                    Text('Nama Bank  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   BNI - Jack Bro**',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                  Row(children: const [
                    Text('No Rekening  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   0751152xxxx',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(children: const [
                    Text('POIN Kamu  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('   1.234.000',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ]),
                  Row(children: const [
                    Text('Total Poin yang ditukar  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   300.000',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                  Row(children: const [
                    Text('Total Uang yang didapat  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   300.000',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                  Row(children: const [
                    Text('Sisa POIN  ', textAlign: TextAlign.justify,
                        style: TextStyle( 
                            fontSize: 16)),
                    Text('   934.000',
                        style: TextStyle(
                            fontSize: 16)),
                  ]),
                ],
              ),
            ]),
          ),
        ));
  }
}
