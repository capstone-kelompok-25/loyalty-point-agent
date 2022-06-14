import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderHomeScreen extends StatelessWidget {
  Size size;
  HeaderHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    final userItem = Result();
    final user = modelView.profile.isNotEmpty ? modelView.profile[modelView.profile.length - 1] : userItem;
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: size.height * 0.2 -30,
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
              children: <Widget>[
                Text(
                  'Halo ${user.name}, Selamat Datang',
                  // style: Theme.of(context).textTheme.headline5?.copyWith(
                  style: TextStyle(
                      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Text(
              '${user.noHp}',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
