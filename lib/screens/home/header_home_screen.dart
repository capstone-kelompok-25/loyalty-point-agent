import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';

class HeaderHomeScreen extends StatelessWidget {
  Size size;
  HeaderHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
              bottom: 30 + defaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: const <Widget>[
                Text(
                  'Halo Jack, Selamat Datang',
                  // style: Theme.of(context).textTheme.headline5?.copyWith(
                  style: TextStyle(
                      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: const Text(
              '08120000012',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
