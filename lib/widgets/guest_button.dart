import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/widgets/title_text_widget.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Container(
       width: size.width*0.4,
        height: size.height*0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          color: AppColors.lightPrimary
        ),
        child: const Center(
          child:
              TitleTextWidget(title: 'guest ?', fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
