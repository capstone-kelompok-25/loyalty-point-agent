import 'package:capstone/screens/home/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GePo'),
      ),
      bottomNavigationBar: BottomNavigationScreen(),
      body: HomeList(),
    );
  }
}

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    // PointViewModel viewModel = Provider.of<PointViewModel>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      // child: body(),
    );
  }
}