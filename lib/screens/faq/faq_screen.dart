import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/faq/detail_faq_screen.dart';
import 'package:capstone/screens/faq/header_faq_screen.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    final userItem = Result();
    final user = modelView.profile.isNotEmpty ? modelView.profile[modelView.profile.length - 1] : userItem;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: secondaryColor,
        child: const Icon(Icons.email)
      ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderFaqScreen(size: size),
              SizedBox(height: 20),
              Text(
                "Hai ${user.name}, cari solusi untukmu disini", textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
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
                    child: Column(
                      children: [
                        Card(
                        child: ListTile(
                          title: Text('Bagaimana Cara Menukar Poin?',
                              style: const TextStyle(fontSize: 16)),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Card(
                      child: ListTile(
                        title: Text('Bagaimana Jika Transaksi Tertunda?',
                            style: const TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    // SizedBox(height: 20),
                      Card(
                      child: ListTile(
                        title: Text('Apa yang Dilakukan Ketika Lupa PIN?',
                            style: const TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    // SizedBox(height: 20),
                      Card(
                      child: ListTile(
                        title: Text('Mengapa POIN Saya Bertambah?',
                            style: const TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    // SizedBox(height: 20),
                      Card(
                      child: ListTile(
                        title: Text('Bagaimana Jika Saya Lupa Password?',
                            style: const TextStyle(fontSize: 16)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                      ]
                    ),
                    
                  ),
            ],
          ),
        )),
    );
  }
}