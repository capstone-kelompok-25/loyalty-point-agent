import 'package:capstone/screens/transaction/emoney/detail_transaction_emoney.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailEMoneyScreen extends StatefulWidget {
  const DetailEMoneyScreen({Key? key}) : super(key: key);

  @override
  State<DetailEMoneyScreen> createState() => _DetailEMoneyScreenState();
}

class _DetailEMoneyScreenState extends State<DetailEMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Money',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // key: formKey,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Nomor Tujuan',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    ListTile(
                      title: Text('Jack Brown'),
                      subtitle: Text('Shopeepay - 081288812345'),
                      leading: Image.asset("assets/img/ShopeePay.png")
                    ),
                    SizedBox(height: 10),
                    Text("Nominal"),
                    SizedBox(height: 10),
                    Expanded(child: GridEMoney()),
                    SizedBox(height: 10),
                    Divider(),
                    Container(
                      child: ListTile(
                        textColor: Color.fromARGB(255, 75, 75, 75),
                        title: Text('Total Penukaran',
                            style: TextStyle(fontSize: 16)),
                        subtitle: Text("Rp. 300.000"),
                        trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailTransactionEMoneyScreen();
                                  }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tween),
                                        child: child);
                                  }),
                                );
                            }, child: Text("Next")),
                      ),
                    ),
                  ]),
            )));
  }
}

class GridEMoney extends StatefulWidget {
  const GridEMoney({Key? key}) : super(key: key);

  @override
  State<GridEMoney> createState() => _GridEMoneyState();
}

class _GridEMoneyState extends State<GridEMoney> {
  List<String> cashout = [
    'Rp. 50.000',
    'Rp. 100.000',
    'Rp. 150.000',
    'Rp. 200.000',
    'Rp. 250.000',
    'Rp. 300.000',
    'Rp. 350.000',
    'Rp. 400.000'
  ];
  List<String> poin = [
    '50.000 poin',
    '100.000 poin',
    '150.000 poin',
    '200.000 poin',
    '250.000 poin',
    '300.000 poin',
    '350.000 poin',
    '400.000 poin'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                          title: Text(cashout[index],
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text(poin[index],
                              style: TextStyle(color: Colors.blue))),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}