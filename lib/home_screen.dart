import 'package:flutter/material.dart';
import 'package:islami_app/nav_bar_unselected.dart';
import 'package:islami_app/selected_nav_bar.dart';
import 'package:islami_app/taps/hadeth_tap.dart';
import 'package:islami_app/taps/quran_tap.dart';
import 'package:islami_app/taps/radio_tap.dart';
import 'package:islami_app/taps/sebha_tap.dart';
import 'package:islami_app/taps/time_tap.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'quran'),
            activeIcon: SelectedNavBar(imagename: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'hadeth'),
            activeIcon: SelectedNavBar(imagename: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'sebha'),
            activeIcon: SelectedNavBar(imagename: 'sebha'),
            label: 'Sebha',
          ),

          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'radio'),
            activeIcon: SelectedNavBar(imagename: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'time'),
            activeIcon: SelectedNavBar(imagename: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
