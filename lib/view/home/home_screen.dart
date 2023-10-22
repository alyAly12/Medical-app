import 'package:flutter/material.dart';
import 'package:medical_app/view/home/home_screen_body.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static String id = 'homeScreen';
  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body:HomeScreenBody() ,
      ),
    );
  }
}
