import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/widgets/title_text_widget.dart';



class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: size.width*0.4,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
           border: Border.all(
             color: AppColors.lightPrimary,
             width: 2
           )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/gmail.png',
                ),
              ),
              const Flexible(child:  TitleTextWidget(title: 'Google', fontSize: 20, color: Colors.blue))
            ],
          )
        ),
      ),
    );
  }
}