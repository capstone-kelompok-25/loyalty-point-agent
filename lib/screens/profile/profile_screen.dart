import 'package:capstone/model/user_model.dart';
import 'package:capstone/screens/login/login_screen.dart';
import 'package:capstone/screens/login/user_view_model.dart';
import 'package:capstone/screens/pin/edit_pin_screen.dart';
import 'package:capstone/screens/profile/atur_profile_screen.dart';
import 'package:capstone/screens/profile/header_profile_screen.dart';
import 'package:capstone/screens/qrcode/qrcode_screen.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/splash_screen.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  // final int id;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: secondaryColor,
    minimumSize: const Size(250, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    UserViewModel modelView = Provider.of<UserViewModel>(context);
    final userItem = UserModel(name: '', email: '', password: '', phone: '');
    final user = modelView.profile.isNotEmpty
        ? modelView.profile[modelView.profile.length - 1]
        : userItem;

    // final user = UserPreferences.myUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        HeaderProfileScreen(size: size),
        buildProfile(user, context),
        const SizedBox(height: 24),
      ]),
    );
  }

  Widget buildProfile(UserModel user, BuildContext context) {
    // final user = viewModel.profile;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRCodeScreen()));
              },
              child: const ListTile(
                title: Text('Tunjukkan QR Code Member',
                    style: TextStyle(fontSize: 16)),
                subtitle: Text('Gunakan saat belanja untuk dapat poin',
                    style: TextStyle(fontSize: 10)),
                trailing: Icon(Icons.qr_code),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return const AturProfileScreen();
                  }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                    final tween = Tween(begin: 0.0, end: 1.0);
                    return FadeTransition(
                        opacity: animation.drive(tween), child: child);
                  }),
                );
              },
              child: ListTile(
                  iconColor: Color.fromARGB(255, 75, 75, 75),
                  textColor: Color.fromARGB(255, 75, 75, 75),
                  title: Text('Atur Profile', style: TextStyle(fontSize: 16)),
                  leading: Icon(Icons.person)),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditPINScreen()));
              },
              child: ListTile(
                iconColor: Color.fromARGB(255, 75, 75, 75),
                textColor: Color.fromARGB(255, 75, 75, 75),
                title: Text('Ubah Kode PIN', style: TextStyle(fontSize: 16)),
                leading: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Card(
            child: ListTile(
              iconColor: Color.fromARGB(255, 75, 75, 75),
              textColor: Color.fromARGB(255, 75, 75, 75),
              title: Text('Syarat & Ketentuan',
                  style: const TextStyle(fontSize: 16)),
              leading: Icon(Icons.library_books),
            ),
          ),
          const SizedBox(height: 4),
          const Card(
            child: ListTile(
              iconColor: Color.fromARGB(255, 75, 75, 75),
              textColor: Color.fromARGB(255, 75, 75, 75),
              title: Text('Kebijakan & Privasi',
                  style: const TextStyle(fontSize: 16)),
              leading: Icon(Icons.shield),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () => logout(),
              child: const Text("Log Out"))
        ],
      ),
    );
  }

  void logout() async {
    // ketika logout clear set preferences value login.result
    SharedPref sharedPref = SharedPref();
    sharedPref.clear();
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return const SplashScreen();
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0);
        return FadeTransition(opacity: animation.drive(tween), child: child);
      }),
    );
  }
}
