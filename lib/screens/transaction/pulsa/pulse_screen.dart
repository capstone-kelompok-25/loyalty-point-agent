import 'package:capstone/screens/transaction/pulsa/daftar_provider_widget.dart';
import 'package:capstone/screens/transaction/pulsa/detail_paket_data.dart';
import 'package:capstone/screens/transaction/pulsa/detail_transaction_pulse.dart';
import 'package:flutter/material.dart';

class Pulse_Screen extends StatefulWidget {
  const Pulse_Screen({Key? key}) : super(key: key);

  @override
  State<Pulse_Screen> createState() => _Pulse_ScreenState();
}

class _Pulse_ScreenState extends State<Pulse_Screen>
    with SingleTickerProviderStateMixin {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: Colors.white,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final _telpController = TextEditingController();
  String telp = '';
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
    });
    super.initState();
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
        title: Text('Isi Pulsa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        centerTitle: true,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              const Text(
                'Nomor Ponsel',
                style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
              ),
              TextFormField(
                controller: _telpController,
                cursorColor: Colors.black,
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
                height: 20,
              ),
              const Text(
                'Daftar Operator Seluler',
                style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
              ),
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return const DaftarProvider();
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                            opacity: animation.drive(tween), child: child);
                      }),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset("assets/img/telkomsel.png"),
                    title: Text("TELKOMSEL",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75))),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              SizedBox(height: 5),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text('Pulsa',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromARGB(255, 75, 75, 75))),
                  ),
                  Tab(
                      child: Text('Paket Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 75, 75)))),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  children: [Pulsa_Screen(), PaketData_Screen()],
                  controller: _tabController,
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  textColor: Color.fromARGB(255, 75, 75, 75),
                  title:
                      Text('Total Penukaran', style: TextStyle(fontSize: 16)),
                  subtitle: Text("Rp. 300.000"),
                  trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return DetailTransactionPulseScreen();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(begin: 0.0, end: 1.0);
                            return FadeTransition(
                                opacity: animation.drive(tween), child: child);
                          }),
                        );
                      },
                      child: Text("Next")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pulsa_Screen extends StatefulWidget {
  const Pulsa_Screen({Key? key}) : super(key: key);

  @override
  State<Pulsa_Screen> createState() => _Pulsa_ScreenState();
}

class _Pulsa_ScreenState extends State<Pulsa_Screen> {
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
      child: new Container(
        child: new Center(
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

class PaketData_Screen extends StatefulWidget {
  const PaketData_Screen({Key? key}) : super(key: key);

  @override
  State<PaketData_Screen> createState() => _PaketData_ScreenState();
}

class _PaketData_ScreenState extends State<PaketData_Screen> {
  List<String> paketData = ['15GB', '15GB'];
  List<String> poinPaketData = ['15.000 poin', '15.000 poin'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    child: Text('Internet',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                      child: Text('Lihat Detail',
                                          style: TextStyle(color: Colors.blue)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(pageBuilder:
                                              (context, animation,
                                                  secondaryAnimation) {
                                            return const DetailPaketData();
                                          }, transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            final tween =
                                                Tween(begin: 0.0, end: 1.0);
                                            return FadeTransition(
                                                opacity: animation.drive(tween),
                                                child: child);
                                          }),
                                        );
                                      }),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  paketData[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  poinPaketData[index],
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
