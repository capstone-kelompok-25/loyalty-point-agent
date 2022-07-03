import 'package:capstone/screens/transaction/pulsa/daftar_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PulsaScreen extends StatefulWidget {
  const PulsaScreen({Key? key}) : super(key: key);

  @override
  State<PulsaScreen> createState() => _PulsaScreenState();
}

class _PulsaScreenState extends State<PulsaScreen>
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
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Pulsa'),
    Tab(text: 'Paket Data'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
    });
  }

  @override
  void dispose() {
    _telpController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Isi Pulsa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            child: Column(
                children: <Widget>[
                  Form(
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
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                          ),
                          ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const DaftarProvider();
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
                                leading:
                                    Image.asset("assets/img/telkomsel.png"),
                                title: Text("TELKOMSEL",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 75, 75, 75))),
                                trailing: Icon(Icons.arrow_forward_ios),
                              )),
                          Container(
                            child: TabBar(
                              controller: _tabController,
                              tabs: myTabs,
                            ),
                          ),
                          TabBarView(
                            controller: _tabController,
                            children: myTabs.map((Tab tab) {
                              final String label = tab.text!.toLowerCase();
                              return Center(
                                child: Text(
                                  'This is the $label tab',
                                  style: const TextStyle(fontSize: 36),
                                ),
                              );
                            }).toList(),
                          ),
                          // GridView.builder(
                          //   gridDelegate:
                          //       const SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 2,
                          //           mainAxisSpacing: 5,
                          //           crossAxisSpacing: 5),
                          //   itemCount: cashout.length,
                          //   itemBuilder: (context, index) {
                          //       return GestureDetector(
                          //         onTap: () {},
                          //         child: Card(
                          //             child: ListTile(
                          //                 title: Text(cashout[index], style: TextStyle(color: Colors.black)),
                          //                 subtitle: Text(poin[index], style: TextStyle(color: Colors.blue))
                          //             ),),
                          //       );
                          //   },
                          // ),
                          SizedBox(height: 100),
                          Divider(),
                          Container(
                            child: ListTile(
                              textColor: Color.fromARGB(255, 75, 75, 75),
                              title: Text('Total Penukaran',
                                  style: TextStyle(fontSize: 16)),
                              subtitle: Text("Rp. 300.000"),
                              trailing: ElevatedButton(
                                  onPressed: () {}, child: Text("Next")),
                            ),
                          ),
                        ]))])));
  }
}
