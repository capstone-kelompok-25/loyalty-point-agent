import 'package:capstone/model/history_model.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:capstone/screens/register/register_view_model.dart';
import 'package:capstone/screens/transaction/transaction_view_model.dart';
import 'package:capstone/splash_screen.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/login/user_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryViewModel(),
        ),
         ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Point.ID',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
