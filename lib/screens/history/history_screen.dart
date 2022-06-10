import 'package:capstone/screens/history/detail_transaction.dart';
import 'package:capstone/screens/history/header_history_transaction.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final modelView =
                  Provider.of<HistoryViewModel>(context, listen: false);
    return Scaffold(
      body: HistoryScreenList(viewModel: modelView),
    );
  }
}

class HistoryScreenList extends StatelessWidget {
  final HistoryViewModel viewModel;
  const HistoryScreenList({Key? key, required this.viewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _history = viewModel.history;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderHistoryTransaction(size: size),
            // ListView.separated(
            //   itemCount: viewModel.history.length,
            //   itemBuilder: (context, index) {
                
            //     return 
            GestureDetector(
                  // key: Key(history.id.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen()
                      ),
                    );
                  },
                  child: const Card(
                    child: ListTile(
                      title: Text('Reedem Cashout',
                          style: TextStyle(fontSize: 16)),
                      subtitle: Text('29 Mei 2022',
                          style: TextStyle(fontSize: 15)),
                      leading: Icon(Icons.payment),
                      trailing: Text('Sukses',
                          style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
              // },
              // separatorBuilder: (context, index) {
              //   return const SizedBox(
              //     height: 1,
              //   );
              // },
            // ),
          ],
        ),
      ),
    );
  }
}