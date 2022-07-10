import 'package:capstone/screens/faq/faq_screen.dart';
import 'package:capstone/screens/history/empty_task_screen.dart';
import 'package:capstone/screens/history/history_list_screen.dart';
import 'package:capstone/screens/history/history_screen.dart';
import 'package:capstone/screens/history/history_view_model.dart';
import 'package:capstone/screens/home/home_screen.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:capstone/screens/qrcode/qrcode_screen.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  String id = '';
  String token = '';

  Future getData() async {
    // await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String idUser = await sharedPref.read("id");
    String tokens = await sharedPref.read("token");

    setState(() {
      id = idUser.replaceAll('"', '');
      token = tokens.replaceAll('"', '');
    });
    return "done getting data";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value){
      print(value);
    });
    super.initState();
  }


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),
    const FAQScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HistoryViewModel>(context, listen: false);

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 75, 75, 75),
            ),
          ),
          BottomNavigationBarItem(
            label: 'History',
            activeIcon: Icon(
              Icons.history,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.history,
              color: Color.fromARGB(255, 75, 75, 75),
            ),
          ),
          BottomNavigationBarItem(
            label: 'FAQ',
            activeIcon: Icon(
              Icons.question_mark,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.question_mark,
              color: Color.fromARGB(255, 75, 75, 75),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 75, 75, 75),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          
          if(id != '' && token != '') {
            modelView.getHistory(id, token); 
          }
          
        },
      ),
    );
  }
}
