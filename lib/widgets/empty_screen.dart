import 'package:flutter/material.dart';
import 'package:medical_app/widgets/subtitle_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';


import '../app_consts/app_color.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.title,
    required this.img,
    required this.subTitle,
  });
  final String title;
  final String img;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              img,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            const TitleTextWidget(
              title: 'Whoops!',
              color: Colors.red,
              fontSize: 45,
            ),
            TitleTextWidget(
              title: title,
              fontSize: 22,
            ),
            const SizedBox(
              height: 20,
            ),
            SubtitleTextWidget(
              subTitle: subTitle,
              fontSize: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, SearchScreen.id);
                },
                child: const TitleTextWidget(title: 'Pick date now'))
          ],
        ),
      ),
    );
  }
}
