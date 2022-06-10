import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Detail Transaction",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Card(
          child: Column(
            children: const [
              Center(
                child: Text(
                  'Berhasil', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )
              ),
              Center(
                child: Text(
                  '29 Mei 2022 03.00 WIB', style: TextStyle(fontSize: 10)
                )
              ),
              Text(
                  'Detail Transaksi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                )

            ]
          ),
        ),
      )
    );
  }
}