import 'package:capstone/screens/history/detail_transaction.dart';
import 'package:capstone/screens/history/header_history_transaction.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:flutter/material.dart';

class HistoryScreenList extends StatelessWidget {
  final HistoryViewModel viewModel;

   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.red,
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

   HistoryScreenList({Key? key, required this.viewModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _history = viewModel.history;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.separated(
              itemCount: viewModel.history.length,
              itemBuilder: (context, index) {
                final history = viewModel.history[index];
                return
            GestureDetector(
              key: Key(history.id.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(_history[index].keterangan!, style: TextStyle(fontSize: 16)),
                  subtitle: Text(_history[index].tanggal!, style: TextStyle(fontSize: 15)),
                  leading: Icon(Icons.payment),
                  trailing: ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: (){},
                    child: Text(_history[index].status!),
                  ),
                  // Text('Sukses',
                  //     style: TextStyle(fontSize: 10)),
                ),
              ),
            );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 1,
              );
            },
            ),
    );
  }
}