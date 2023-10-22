import 'package:flutter/material.dart';
import 'package:medical_app/view/inner_screens/specialization_screen.dart';
import 'package:medical_app/widgets/subtitle_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SearchScreen.id,arguments: title);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          elevation: 2,
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image,
                    height:size.height*0.2,
                    width: size.height*0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10,),
                 TitleTextWidget(title: title),
                 SubtitleTextWidget(subTitle: subtitle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
