import 'package:capstone/model/user_model.dart';
import 'package:capstone/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  // final int id;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    UserViewModel modelView = Provider.of<UserViewModel>(context);
    final userItem = UserModel(
      name: '', 
      email: '', 
      password: '', 
      phone: '');
    final user = modelView.profile.isNotEmpty ? modelView.profile[modelView.profile.length - 1] : userItem;

    // final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 25),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 24,
        ),
        buildProfile(user),
        const SizedBox(height: 24),
      ]),
    );
  }

  Widget buildProfile(UserModel user) {
    // final user = viewModel.profile;
    return Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: const TextStyle(fontFamily: 'OpenSans', color: Colors.grey),
        ),
        Text(
          user.phone,
          style: const TextStyle(fontFamily: 'OpenSans', fontSize: 16),
        ),
      ],
    );
  }
}
