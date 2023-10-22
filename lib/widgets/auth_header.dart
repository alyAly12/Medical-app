import 'package:flutter/material.dart';
import 'package:medical_app/widgets/subtitle_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';

import '../app_consts/app_color.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
   required this.title, required this.subText,
  });


  final String title;
  final String subText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.18,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.lightPrimary,
          borderRadius: BorderRadius.only(
            bottomRight:Radius.circular(12) ,
            bottomLeft: Radius.circular(12) ,
          )
      ),
      child: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextWidget(title:title,
              fontSize: 25,
              color: Colors.white,),
            const SizedBox(
              height: 10,
            ),
            SubtitleTextWidget(
              subTitle: subText,
              fontSize: 18,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}