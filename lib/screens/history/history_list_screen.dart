import 'package:capstone/screens/history/detail_transaction.dart';
import 'package:capstone/screens/history/header_history_transaction.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:flutter/material.dart';

class HistoryScreenList extends StatelessWidget {

  final ButtonStyle pendingButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.red,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  final ButtonStyle successButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.green,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  HistoryScreenList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _history = viewModel.history;
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
          children: [
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailScreen()),
                  );
                },
                child: ListTile(
                  title: Text("Reedem Cash Out", style: TextStyle(fontSize: 16)),
                  subtitle: Text("29 Mei 2022", style: TextStyle(fontSize: 15)),
                  leading: Icon(Icons.payment),
                  trailing: ElevatedButton(
                    style: pendingButtonStyle,
                    onPressed: () {},
                    child: Text("Pending"),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailScreen()),
                  );
                },
                child: ListTile(
                  title: Text("Reedem Pulsa", style: TextStyle(fontSize: 16)),
                  subtitle: Text("29 Mei 2022", style: TextStyle(fontSize: 15)),
                  leading: Icon(Icons.payment),
                  trailing: ElevatedButton(
                    style: successButtonStyle,
                    onPressed: () {},
                    child: Text("Success"),
                  ),
                ),
              ),
            ),
          ],
              ),
            ),
        ));
  }

  fullname() async {
    SharedPref sharedPref = SharedPref();
    String? token = await sharedPref.read("token");
    String? fullname = await sharedPref.read("fullname");
    String? noHp = await sharedPref.read("no_hp");
    String? poin = await sharedPref.read("poin");
    return fullname;
  }
}
