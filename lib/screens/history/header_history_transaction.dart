import 'package:capstone/utils/color.dart';
import 'package:capstone/utils/size.dart';
import 'package:flutter/material.dart';

class HeaderHistoryTransaction extends StatelessWidget {
  Size size;
  HeaderHistoryTransaction({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
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
              color: primaryColor,
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'History Transaction',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
