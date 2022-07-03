import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AturProfileScreen extends StatefulWidget {
  const AturProfileScreen({Key? key}) : super(key: key);

  @override
  State<AturProfileScreen> createState() => _AturProfileScreenState();
}

class _AturProfileScreenState extends State<AturProfileScreen> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _telpController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  String nama = '';
  String email = '';
  String telp = '';

  @override
  void initState() {
    super.initState();

    _namaController.addListener(() {
      setState(() {
        nama = _namaController.text;
      });
     });

     _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
     });

     _telpController.addListener(() {
      setState(() {
        telp = _telpController.text;
      });
     });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _telpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel modelView = Provider.of<LoginViewModel>(context);
    final userItem = modelView.login;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Atur Profile",
        style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),),
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
                SizedBox(height: 20,),
                 const Text('Nama Lengkap'),
              TextFormField(
                controller: _namaController..text = "${userItem!.fullname}",
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
                validator: (value) {
                  if (value != null && value.length > 2) {
                    return null;
                  } else {
                    return 'Masukkan Nama Lengkap';
                  }
                },
              ),
                const Text('Email'),
              TextFormField(
                controller: _emailController..text = "${userItem.email}",
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
              const Text('Nomor Handphone'),
              TextFormField(
                  controller: _telpController..text = "${userItem.noHp}",
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
                    if (value != null && value.length > 10) {
                      return null;
                    } else {
                      return 'Masukkan Nomor Telepon';
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