import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderHomeScreen extends StatefulWidget {
  Size size;
  HeaderHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  State<HeaderHomeScreen> createState() => _HeaderHomeScreenState();
}

class _HeaderHomeScreenState extends State<HeaderHomeScreen> {
  String fullname = "";
  String noHp = "";

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String fname = await sharedPref.read("fullname");
    String noPhone = await sharedPref.read("no_hp");
    setState(() {
      fullname = fname.replaceAll('"', '');
      noHp =  noPhone.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value){
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: widget.size.height * 0.2 - 30,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
              bottom: 30 + defaultPadding,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Halo $fullname, Selamat Datang",
                  // style: Theme.of(context).textTheme.headline5?.copyWith(
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: <Widget> [
                Text(
                  noHp,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget fname() {
    // Future fullname = getData("fullname");
    // return Text(
    //               'Halo $fullname, Selamat Datang',
    //               // style: Theme.of(context).textTheme.headline5?.copyWith(
    //               style: TextStyle(
    //                   fontSize: 18,
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.bold),
    //             );
    // SharedPref sharedPref = SharedPref();
    // String? fullname = await sharedPref.read("fullname");
    // Future<String?> fullname = getData("fullname");
    // print("fullname: $fullname");
    // return fullname;
  // }

  // noHp() {
    // SharedPref sharedPref = SharedPref();
    // Future<String?> noHp = getData("no_hp");
    // print("no hp: $noHp");
    // return noHp;
  // }

  
}
