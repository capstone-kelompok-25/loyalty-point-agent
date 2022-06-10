import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/login/login_screen.dart';
import 'package:capstone/screens/pin/pin_screen.dart';
import 'package:capstone/screens/register/register_screen.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/login/user_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterSplashScreen extends StatefulWidget {
  const AfterSplashScreen({Key? key}) : super(key: key);

  @override
  State<AfterSplashScreen> createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(300, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginViewModel>(context, listen: false).getLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Image.asset('assets/img/logo.png', height: 100, width: 200),
              const SizedBox(
                height: 40,
              ),
              welcomeTextWidget(),
              const Spacer(),
              getLogin(context),
              const SizedBox(
                height: 20,
              ),
              getRegister(context),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeTextWidget() {
    return Center(
      child: Column(
        children: const [
          Text(
            "When you shop with Point.ID,",
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Text(
            "you wll make extra money.",
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget getLogin(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        }));
      },
      child: const Text('Sign In',
          style: TextStyle(
            fontFamily: 'Merriweather',
          )),
    );
  }

  Widget getRegister(BuildContext context) {
    final modelView = Provider.of<UserViewModel>(context, listen: false);
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RegisterScreen(
            onCreate: (register) {
              modelView.postUser(register);
              print('Posting Data...');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PinScreen(),
                ),
              );
            },
          );
        }));
      },
      child: const Text('Sign Up',
          style: TextStyle(
            fontFamily: 'Merriweather',
          )),
    );
  }
}
