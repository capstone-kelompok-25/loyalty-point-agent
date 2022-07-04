import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EditPINScreen extends StatefulWidget {
  const EditPINScreen({Key? key}) : super(key: key);

  @override
  State<EditPINScreen> createState() => _EditPINScreenState();
}

class _EditPINScreenState extends State<EditPINScreen> {
  final _currentpin = TextEditingController();
  final _newpin = TextEditingController();
  final _confirmnewpin = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  String currentpin = '';
  String newpin = '';
  String confirmnewpin = '';

  @override
  void initState() {
    super.initState();

    _currentpin.addListener(() {
      setState(() {
        currentpin = _currentpin.text;
      });
    });

    _newpin.addListener(() {
      setState(() {
        newpin = _newpin.text;
      });
    });

    _confirmnewpin.addListener(() {
      setState(() {
        confirmnewpin = _confirmnewpin.text;
      });
    });
  }

  @override
  void dispose() {
    _currentpin.dispose();
    _newpin.dispose();
    _confirmnewpin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ubah PIN",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hindari penggunaan PIN yang telah sering dipakai seperti 1234, 0000, atau 1111 agar akun kamu lebih aman.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Kode PIN Saat Ini'),
                  TextFormField(
                    controller: _currentpin,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.newpin),
                        hintText: 'Masukkan 4 digit Kode PIN Saat Ini',
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
                      if (value != null &&
                          value.length > 3 &&
                          value.length < 5) {
                        return null;
                      } else {
                        return 'Masukkan 4 digit Kode PIN Saat Ini';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Kode PIN Baru'),
                  TextFormField(
                    controller: _newpin,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.newpin),
                        hintText: 'Masukkan 4 digit Kode PIN Baru',
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
                    validator: (newpin) {
                      if (newpin != null &&
                          newpin.length > 3 &&
                          newpin.length < 5) {
                        return null;
                      } else {
                        return 'Masukkan 4 digit Kode PIN';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Konfirmasi Kode PIN Baru'),
                  TextFormField(
                      controller: _confirmnewpin,
                      obscureText: true,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.lock),
                          hintText: 'Masukkan kembali 6 digit Kode PIN Baru',
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
                        if (value != null &&
                            value.length > 3 &&
                            value.length < 5) {
                          return null;
                        } else {
                          return 'Masukkan 6 digit Kode PIN';
                        }
                      }),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    child: const Text(
                      'Save',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
