import 'package:capstone/screens/transaction/cashout/daftar_bank_widget.dart';
import 'package:capstone/screens/transaction/cashout/detail_transaction_cashout.dart';
import 'package:capstone/screens/transaction/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: Colors.white,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _namaRekening = TextEditingController();
  final _nomorRekening = TextEditingController();
  final _daftarBank = TextEditingController();
  String namaRek = '';
  String nomorRek = '';

  @override
  void initState() {
    super.initState();
    _namaRekening.addListener(() {
      setState(() {
        namaRek = _namaRekening.text;
      });
    });
    _nomorRekening.addListener(() {
      setState(() {
        nomorRek = _nomorRekening.text;
      });
    });
  }

  @override
  void dispose() {
    _namaRekening.dispose();
    _nomorRekening.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cash Out',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                      'A.N Rekening',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    TextFormField(
                      controller: _namaRekening,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone,
                              color: Color.fromARGB(255, 75, 75, 75)),
                          hintText: 'Jack Brown',
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
                          return 'Masukkan Nama Pemilik Rekening';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Nomor Rekening',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    TextFormField(
                      controller: _namaRekening,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone,
                              color: Color.fromARGB(255, 75, 75, 75)),
                          hintText: '0711xxxxxxxxx',
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
                          return 'Masukkan Nomor Rekening';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'BANK',
                      style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                    ),
                    ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const DaftarBank();
                            }, transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                  opacity: animation.drive(tween),
                                  child: child);
                            }),
                          );
                        },
                        child: ListTile(
                          leading: Image.asset("assets/img/bni.png"),
                          title: Text("BNI",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75))),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                    SizedBox(height: 5),
                    Expanded(child: GridCashOut()),
                    SizedBox(height: 5),
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
                                    return DetailScreenCashOut();
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

class GridCashOut extends StatefulWidget {
  const GridCashOut({Key? key}) : super(key: key);

  @override
  State<GridCashOut> createState() => _GridCashOutState();
}

class _GridCashOutState extends State<GridCashOut> {
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
