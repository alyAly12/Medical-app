import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_theme.dart';
import 'package:medical_app/root_screen.dart';
import 'package:medical_app/view/appointmet/appointment_screen.dart';
import 'package:medical_app/view/auth/forget_password_screen.dart';
import 'package:medical_app/view/auth/login_screen.dart';
import 'package:medical_app/view/auth/signup_screen.dart';
import 'package:medical_app/view/category/category_screen.dart';
import 'package:medical_app/view/home/home_screen.dart';
import 'package:medical_app/view/inner_screens/details_screen.dart';
import 'package:medical_app/view/inner_screens/favorite_doctors.dart';
import 'package:medical_app/view/inner_screens/reservation_screen.dart';
import 'package:medical_app/view/inner_screens/specialization_screen.dart';
import 'package:medical_app/view/inner_screens/viewed_recently.dart';
import 'package:medical_app/view/profile/profile_screen.dart';
import 'package:medical_app/view_model/doctors_provider.dart';
import 'package:medical_app/view_model/favorite_provider.dart';
import 'package:medical_app/view_model/reservation_provider.dart';
import 'package:medical_app/view_model/theme_provider.dart';
import 'package:medical_app/view_model/viewed_recently_provider.dart';
import 'package:provider/provider.dart';


void main()async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ChangeNotifierProvider(create: (_)=>DoctorsProvider()),
      ChangeNotifierProvider(create: (_)=>ReservationProvider()),
      ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
      ChangeNotifierProvider(create: (_)=>ViewedRecentlyProvider())
    ],
    child: Consumer<ThemeProvider>(
      builder: (BuildContext context, themeProvider, Widget? child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Medical App',
          theme: AppTheme.themeData(
              isDarkTheme: themeProvider.getDarkTheme,
              context: context),
          home: const RootScreen(),
          routes: {
            HomeScreen.id:(context)=>const HomeScreen(),
            CategoryScreen.id:(context)=>const CategoryScreen(),
            AppointmentScreen.id:(context)=>const AppointmentScreen(),
            ProfileScreen.id:(context)=>const ProfileScreen(),
            ReservationScreen.id:(context)=>const ReservationScreen(),
            FavoriteDoctor.id:(context)=>const FavoriteDoctor(),
            ViewedRecently.id:(context)=>const ViewedRecently(),
            LoginScreen.id:(context)=>const LoginScreen(),
            SignUpScreen.id:(context)=>const SignUpScreen(),
            ForgetPassWordScreen.id:(context)=>const ForgetPassWordScreen(),
            DetailsScreen.id:(context)=>const DetailsScreen(),
            SearchScreen.id:(context)=>const SearchScreen()
          },
        );
      },
    ),
    );
  }
}


