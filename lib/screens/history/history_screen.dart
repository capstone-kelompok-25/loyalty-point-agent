import 'package:capstone/screens/history/detail_transaction.dart';
import 'package:capstone/screens/history/empty_task_screen.dart';
import 'package:capstone/screens/history/header_history_transaction.dart';
import 'package:capstone/screens/history/history_list_screen.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HistoryViewModel>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
              HeaderHistoryTransaction(size: size),
              HistoryScreenList(),
            ]),
        ));
  }

  // Widget buildHistoryScreen() {
  //   return Consumer<HistoryViewModel>(
  //     builder: (context, modelView, child) {
  //       if (modelView.history.isNotEmpty) {
  //         return HistoryScreenList(viewModel: modelView);
  //       } else {
  //         return const EmptyTaskScreen();
  //       }
  //     },
  //   );
  // }
}
