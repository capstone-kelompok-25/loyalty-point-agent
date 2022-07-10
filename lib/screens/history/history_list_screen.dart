import 'package:capstone/screens/history/detail_transaksi/detail_transaction.dart';
import 'package:capstone/screens/history/header_history_transaction.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../model/history_model.dart';

class HistoryScreenList extends StatefulWidget {
  final HistoryViewModel viewModel;

  HistoryScreenList({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<HistoryScreenList> createState() => _HistoryScreenListState();
}

class _HistoryScreenListState extends State<HistoryScreenList> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3));
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    print(widget.viewModel.history.length);

    return Container(
      padding: EdgeInsets.only(left: 8, right:8, bottom: 5),
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final _history = widget.viewModel.history[index];
              String date = "${_history.createdat}";
              DateTime parseDate =
                  new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
              var inputDate = DateTime.parse(parseDate.toString());
              var outputFormat = DateFormat('dd MMMM yyyy');
              var outputDate = outputFormat.format(inputDate);
              print(outputDate);
              print(_history.transactionType);
              return Card(
                  child: GestureDetector(
                key: Key(_history.id.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(idTransaction: _history.idTransaction.toString(),)),
                  );
                },
                child: ListTile(
                  title: Text(_history.transactionType.toString(),
                      style: TextStyle(fontSize: 16)),
                  subtitle:
                      Text(outputDate.toString(), style: TextStyle(fontSize: 15)),
                  leading: (_history.transactionType == 'Redeem Bank') ? Icon(Icons.payment) : Icon(Icons.phone_android),
                  trailing: ElevatedButton(
                    style: (_history.statusTransaction == 'PENDING')
                        ? pendingButtonStyle
                        : successButtonStyle,
                    onPressed: () {},
                    child: Text(
                      _history.statusTransaction.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ));
            },
            itemCount: widget.viewModel.history.length,
          ),
        ],
      ),
    );
  }
}
