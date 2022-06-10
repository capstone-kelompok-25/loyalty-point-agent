import 'package:capstone/after_splash_screen.dart';
import 'package:capstone/model/login_model.dart';
import 'package:capstone/screens/widget/bottom_navigation_screen.dart';
import 'package:capstone/screens/pin/pin_screen.dart';
import 'package:capstone/screens/register/register_screen.dart';
import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  // final Function(UserModel) onCreate;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  late final SharedPreferences logindata;
  String email = '';
  String password = '';
  late bool newUser;

  final formKey = GlobalKey<FormState>();

  checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email').toString();
      password = logindata.getString('password').toString();
    });
    newUser = logindata.getBool('login') ?? true;
    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
          (route) => false);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginViewModel>(context, listen: false).getLogin();
    });
  }

  @override
  void initState() {
    super.initState();

    checkLogin().whenComplete(() {
      setState(() {
        email = _emailController.text;
        password = _passwordController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                return const AfterSplashScreen();
              }, transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 1.0);
                return FadeTransition(
                    opacity: animation.drive(tween), child: child);
              }),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset('assets/img/logo.png', height: 100, width: 200),
              const SizedBox(
                height: 20,
              ),
              const Text('Email address'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    // hintText: 'Email Address',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    focusColor: Colors.grey),
                validator: (email) {
                  if (email != null && EmailValidator.validate(email)) {
                    return null;
                  } else {
                    return 'Enter a valid email';
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Password'),
              TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.lock),
                      // hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      focusColor: Colors.grey),
                  validator: (value) {
                    if (value != null && value.length > 5) {
                      return null;
                    } else {
                      return 'Enter min. 5 characters';
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  onPressed: () => getButtonLogin(modelView),
                  ),
              const SizedBox(
                height: 100,
              ),
              // Spacer(),
              const Text(
                "I'm a new member.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              sign_up(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget sign_up(){
    return TextButton(
                // style: TextButton.styleFrom(
                //   textStyle: const TextStyle(fontSize: 20),
                // ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return RegisterScreen(
                      onCreate: (register) {
                        // modelView.postUser(register);
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
                child: const Text('Sign Up', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
              );
  }

  getButtonLogin(LoginViewModel modelView) {
    var statusLogin = false;
    var userValid;
    print('di klik');

    try{
      email = _emailController.text;
      password = _passwordController.text;


    final userItem = LoginModel(email: email, password: password);
    modelView.postLogin(userItem);
    }catch(e){
      print("error $e");
    }
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const BottomNavigationScreen();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        }),
      );

    print(modelView.login.length);
    
  }
}

// for (var users in modelView.login) { 
//       if (users.email == email && users.password == password) {
//         print("berhasil login");
//         // simpan data valid user ke storage
//         statusLogin = true;
//         userValid = users;
//       }
//     }

//     if (statusLogin) {
//       setState(() {
//         modelView.saveUserinStrorage(userValid);
//       });
//       Navigator.push(
//         context,
//         PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
//           return const HomeScreen();
//         }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           final tween = Tween(begin: 0.0, end: 1.0);
//           return FadeTransition(opacity: animation.drive(tween), child: child);
//         }),
//       );
//     } else {
//       Fluttertoast.showToast(
//           msg: "invalid email or password",
//           toastLength: Toast.LENGTH_SHORT,
//           // gravity: ToastGravity.CENTER,
//           backgroundColor: Colors.black,
//           timeInSecForIosWeb: 1,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }