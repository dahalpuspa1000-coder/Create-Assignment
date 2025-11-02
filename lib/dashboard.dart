import 'package:flutter/material.dart';
import 'package:provider_test/core/constants/app_color.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/settings/settingpage.dart';
import 'package:provider_test/homepage.dart';
import 'package:provider_test/hommepage.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavBar> {
  List<Widget> widgetList=[
    HomePage(),Settingpage()
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: primarycolor,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: homestr),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: settingstr)
      ]),
    );
  }
}