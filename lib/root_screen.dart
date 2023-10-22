import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medical_app/view/appointmet/appointment_screen.dart';
import 'package:medical_app/view/category/category_screen.dart';
import 'package:medical_app/view/home/home_screen.dart';
import 'package:medical_app/view/profile/profile_screen.dart';
import 'package:medical_app/view_model/theme_provider.dart';
import 'package:provider/provider.dart';
import 'app_consts/app_color.dart';


class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static String id= ' root-screen';
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  List<Map<String,dynamic>>pages=[
    {'page':const HomeScreen() , 'title':'Home'},
    {'page':const CategoryScreen() , 'title':'Category'},
    {'page':const AppointmentScreen() , 'title':'Appointment'},
    {'page':const ProfileScreen() , 'title':'profile'},
  ];

  void selectedPage(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeState = Provider.of<ThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: selectedPage,
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor:
          isDark ? AppColors.lightPrimary : Colors.blueAccent,
          selectedItemColor:
          isDark ? AppColors.lightPrimary : const Color(0xffB3753D),
          backgroundColor: isDark ? theme.cardColor : Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(selectedIndex == 2
                    ? IconlyBold.calendar
                    : IconlyLight.calendar),
                label: 'Appointment'),
            BottomNavigationBarItem(
                icon: Icon(
                    selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: 'Profile'),
          ]),
    );
  }
}
