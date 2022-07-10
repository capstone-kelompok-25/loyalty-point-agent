import 'package:capstone/screens/login/login_view_model.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:capstone/screens/profile/profile_view_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
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
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _telpController;

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

  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String fname = await sharedPref.read("fullname");
    String emails = await sharedPref.read("email");
    String noPhone = await sharedPref.read("no_hp");
    setState(() {
      nama = fname.replaceAll('"', '');
      email = emails.replaceAll('"', '');
      telp =  noPhone.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    _namaController = TextEditingController();
    _emailController = TextEditingController();
    _telpController = TextEditingController();
    _loadData();
    super.initState();
  }

  void _loadData(){
    ProfileViewModel modelView = Provider.of<ProfileViewModel>(context);
    // var profile = await getData();
    _namaController.text = modelView.profile!.name!;
    _emailController.text = modelView.profile!.email!;
    _telpController.text = modelView.profile!.noHp!;
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
    ProfileViewModel modelView = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Atur Profile",
        style: TextStyle(fontSize: 17),),
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
                controller: _namaController,
                // initialValue: nama,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    // hintText: 'Email Address',
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                controller: _emailController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    // hintText: 'Email Address',
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                  controller: _telpController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.lock),
                      // hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                    final update = modelView.updateProfile(_namaController.text, _emailController.text, _telpController.text);
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