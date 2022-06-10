import 'package:capstone/after_splash_screen.dart';
import 'package:capstone/model/user_model.dart';
import 'package:capstone/screens/login/login_screen.dart';
import 'package:capstone/screens/login/user_view_model.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RegisterScreen extends StatefulWidget {
  final Function(UserModel) onCreate;
  const RegisterScreen({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String phone = '';

  // late SharedPreferences logindata;
  late bool newUser;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  void initial() async {
    // Function(UserModel) onCreate;
    // logindata = await SharedPreferences.getInstance();
    // newUser = logindata.getBool('register') ?? true;
    // setState(() {
    //   username = logindata.getString('username').toString();
    //   email = logindata.getString('email').toString();
    //   password = logindata.getString('password').toString();
    //   phone = logindata.getString('phone').toString();
    //   birth = logindata.getString('birth').toString();
    //   address = logindata.getString('address').toString();
    // });
    // newUser = logindata.getBool('register') ?? true;
    if (newUser == false) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => LoginScreen(onCreate: (user) {

      //     },)),
      //     (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    initial();
    _nameController.addListener(() {
      setState(() {
        username = _nameController.text;
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
    _phoneController.addListener(() {
      setState(() {
        phone = _phoneController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel modelView = Provider.of<UserViewModel>(context);

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
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/img/logo.png',
                          height: 100, width: 200),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Full Name'),
                      TextFormField(
                        controller: _nameController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.length > 4) {
                            return null;
                          } else {
                            return 'Enter at least 4 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('Phone Number'),
                      TextFormField(
                        controller: _phoneController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (phone) {
                          if (phone != null && phone.length <= 12) {
                            return null;
                          } else {
                            return 'Enter max 12 number';
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text('Email address'),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (email) {
                          if (email != null && EmailValidator.validate(email)) {
                            return null;
                          } else {
                            return 'Enter a valid email';
                          }
                        },
                      ),
                      const Text(
                        "We'll never share your email with anyone else",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('Password'),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.length > 5) {
                            return null;
                          } else {
                            return 'Enter min. 5 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            final userItem = UserModel(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                phone: _phoneController.text);
                            print(userItem);

                            widget.onCreate(userItem);
                          },
                          autofocus: false,
                          child: const Text('Register',
                              style: TextStyle(fontFamily: 'OpenSans'))),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "I'm already a member.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      sign_in()
                    ],
                  )),
            )));
  }

  Widget sign_in() {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        }));
      },
      child: const Text(
        'Sign In',
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
