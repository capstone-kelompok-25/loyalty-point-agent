import 'package:capstone/screens/history/empty_task_screen.dart';
import 'package:capstone/screens/home/body_home.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/widget/banner.dart';
import 'package:capstone/screens/widget/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeList();
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
    return Scaffold(
      body: Body()
    );
  }

}