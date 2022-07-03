import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class KebijakanScreen extends StatelessWidget {
  const KebijakanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kebijakan Privasi", style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: ListView(children: [Text("Kebijakan Privasi User"), Text("Lorem Ipsum"),],)),
    );
  }
}