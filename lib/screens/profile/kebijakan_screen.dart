import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class KebijakanScreen extends StatelessWidget {
  const KebijakanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kebijakan Privasi",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text("Kebijakan Privasi User", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          SizedBox(height: 20),
          Text("Lorem Ipsum", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
        ],
      ))),
    );
  }
}
