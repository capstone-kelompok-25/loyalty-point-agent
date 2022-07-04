import 'package:capstone/screens/transaction/emoney/confirm_pin_screen.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';

class DetailTransactionEMoneyScreen extends StatefulWidget {
  String emoney;
  String noTelp;
  String poin;

  DetailTransactionEMoneyScreen({Key? key, required this.emoney, required this.noTelp, required this.poin }): super(key: key);

  @override
  State<DetailTransactionEMoneyScreen> createState() => _DetailTransactionEMoneyScreenState();
}

class _DetailTransactionEMoneyScreenState extends State<DetailTransactionEMoneyScreen> {
  String poins = "";
  
  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String poin = await sharedPref.read("poin");
    setState(() {
      poins = poin.replaceAll('"', '');
    });
    return "done getting data";
  }
  
  @override
  void initState() {
    // TODO: implement initState
    getData().then((value) {
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.green,
    minimumSize: const Size(40, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Detail Transaction",
            style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Card(
                child:
                    Container(
                      padding:
              const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 20),
                  Center(
                        child: Text('Detail E-Money',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  Text('Transaksi Berlangsung',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Wrap(
                          spacing: 260,
                          runSpacing: 260,
                          alignment: WrapAlignment.spaceEvenly,
                          runAlignment: WrapAlignment.spaceEvenly,
                          children: [
                          Text('E-Money', 
                              style: TextStyle( 
                                  fontSize: 16)),
                            
                          Text('${widget.emoney}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Wrap(
                          spacing: 200,
                          runSpacing: 200,
                          alignment: WrapAlignment.spaceEvenly,
                          runAlignment: WrapAlignment.spaceEvenly,
                          children: [
                          Text('Nomor Pengguna', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Text('${widget.noTelp}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                      ],
                  ),
                  SizedBox(height: 30),
                  Text('POIN',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Wrap(
                          spacing: 240,
                          runSpacing: 240,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                          Text('POIN Kamu', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(poins,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Wrap(
                          spacing: 160,
                          runSpacing: 160,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                          Text('Total Poin yang ditukar', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16)),
                          Text('${widget.poin}',
                              style: TextStyle(
                                  fontSize: 16)),
                        ]),
                        Wrap(
                          spacing: 250,
                          runSpacing: 250,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                          Text('Sisa POIN', textAlign: TextAlign.justify,
                              style: TextStyle( 
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('${(int.parse(poins) - int.parse(widget.poin))}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                      ],
                  ),
                ]),
                    ),
              ),
              ListTile(trailing: ElevatedButton(style: raisedButtonStyle ,onPressed: (){
                Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ConfirmPinScreenEMoney();
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
              }, child: Text("Redeem")))
            ],
          ),
        ));
  }
}
