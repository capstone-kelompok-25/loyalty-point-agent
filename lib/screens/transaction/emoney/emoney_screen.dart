import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/transaction/emoney/detail_emoney_screen.dart';
import 'package:capstone/screens/transaction/transaction_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EMoneyScreen extends StatefulWidget {
  const EMoneyScreen({Key? key}) : super(key: key);

  @override
  State<EMoneyScreen> createState() => _EMoneyScreenState();
}

class _EMoneyScreenState extends State<EMoneyScreen> {
  int? _selectedIndex;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(500, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _telpController = TextEditingController();
  String telp = '';
  List<String> emoney = ['Shopeepay', 'Gopay', 'Link Aja!', 'Dana', 'OVO'];
  List<String> icon = [
    "assets/img/ShopeePay.png",
    "assets/img/gopay.png",
    "assets/img/LinkAja.png"
        "assets/img/dana.png",
    "assets/img/ovo.png"
  ];

  @override
  void initState() {
    super.initState();
    _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
    });
  }

  @override
  void dispose() {
    _telpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Money',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Nomor Ponsel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                          ),
                          TextFormField(
                            controller: _telpController,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                                hintText: '08xxxxxxxxxx',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                focusColor: Colors.grey),
                            validator: (value) {
                              if (value != null && value.length > 2) {
                                return null;
                              } else {
                                return 'Masukkan Nomor Ponsel';
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: ListTile(
                              iconColor: Color.fromARGB(255, 75, 75, 75),
                              textColor: Color.fromARGB(255, 75, 75, 75),
                              title: Text('Dompet Digital',
                                  style: TextStyle(fontSize: 16)),
                              leading: Icon(Icons.wallet),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30, child: _buildChips()),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailEMoneyScreen();
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
                              },
                              child: Text("Next"))
                        ])))));
  }

  Widget _buildChips() {
    List<String> emoney = ['Shopeepay', 'Gopay', 'Link Aja!', 'Dana', 'OVO'];
    TransactionViewModel viewModel = Provider.of<TransactionViewModel>(context);
    List<Widget> chips = [];
    List<String> icon = [
      'assets/img/ShopeePay.png',
      'assets/img/gopay.png',
      'assets/img/LinkAja.png',
      'assets/img/dana.png',
      'assets/img/ovo.png'
    ];
    var emoneyChoice = (viewModel.emoney.length > 0)
        ? emoney[viewModel.emoney.length - 1]
        : [];
    print(emoneyChoice);
    print(emoney.length);

    for (int i = 0; i < emoney.length; i++) {
      print(emoney[i]);
      ChoiceChip choiceChip = ChoiceChip(
        selected: emoneyChoice == emoney[i],
        label:
            Text(emoney[i].toString(), style: TextStyle(color: Colors.black)),
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(icon[i]),
        ),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.transparent,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              viewModel.emoney.add(emoney[i]);
              _selectedIndex = i;
            }
          });

          print(viewModel.emoney[viewModel.emoney.length - 1]);
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 5,
      runSpacing: 5,
      runAlignment: WrapAlignment.spaceAround,
      // This next line does the trick.
      children: chips,
    );
  }
}
