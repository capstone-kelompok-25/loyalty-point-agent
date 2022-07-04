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
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Center(
                        child: Text('Berhasil',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Center(
                        child: Text('29 MEI 2022 03.00 WIB',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12))),
                    SizedBox(height: 20),
                    Text('Detail Transaksi',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Wrap(spacing: 200, runSpacing: 200, children: const [
                          Text('ID Transaksi  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('   3375124607',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Wrap(spacing: 160, runSpacing: 160, children: const [
                          Text('Jenis Transaksi  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   Cash Out', style: TextStyle(fontSize: 16)),
                        ]),
                        Wrap(spacing: 210, runSpacing: 210, children: const [
                          Text('Nama Bank  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   BNI - Jack Bro**',
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Wrap(spacing: 200, runSpacing: 200, children: const [
                          Text('No Rekening  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   0751152xxxx',
                              style: TextStyle(fontSize: 16)),
                        ]),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Wrap(spacing: 210, runSpacing: 210, children: const [
                          Text('POIN Kamu  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('   1.234.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Wrap(spacing: 130, runSpacing: 130, children: const [
                          Text('Total Poin yang ditukar  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   300.000', style: TextStyle(fontSize: 16)),
                        ]),
                        Wrap(spacing: 130, runSpacing: 130, children: const [
                          Text('Total Uang yang didapat  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   300.000', style: TextStyle(fontSize: 16)),
                        ]),
                        Wrap(spacing: 200, runSpacing: 200, children: const [
                          Text('Sisa POIN  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text('   934.000', style: TextStyle(fontSize: 16)),
                        ]),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
