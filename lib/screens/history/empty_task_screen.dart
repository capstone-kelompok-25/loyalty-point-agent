import 'package:flutter/material.dart';

class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.history));
  }
}
