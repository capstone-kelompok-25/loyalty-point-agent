import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SyaratScreen extends StatelessWidget {
  const SyaratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Syarat dan Ketentuan",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              child: Row(
        children: [
          Text("Syarat dan Ketentuan", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          SizedBox(height: 20),
          Text("Lorem Ipsum", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
        ],
      ))),
    );
  }
}
