import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SyaratScreen extends StatelessWidget {
  const SyaratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syarat dan Ketentuan", style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: ListView(children: [Text("Syarat dan Ketentuan"), Text("Lorem Ipsum"),],)),
    );
  }
}