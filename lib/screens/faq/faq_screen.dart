import 'package:capstone/screens/faq/detail_faq_screen.dart';
import 'package:capstone/screens/faq/header_faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   // centerTitle: true,
      //   title: const Text(
      //     "FAQ",
      //     style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              HeaderFaqScreen(size: size),
              Text(
                "Hai Jack, cari solusi untukmu disini", textAlign: TextAlign.left,
              ),
              GestureDetector(
                    // key: Key(history.id.toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailFaqScreen()
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('Bagaimana Cara Menukar Poin?',
                            style: const TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
            ],
          ),
        )),
    );
  }
}