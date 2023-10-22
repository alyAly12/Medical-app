import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/app_consts/consts.dart';
import 'package:medical_app/view/category/category_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
static String id = ' Category-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary,
        title: const TitleTextWidget(title: 'Specialization',fontSize: 25,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
        child: GridView.builder(
            itemCount: AppConsts.categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.70),
            ),
            itemBuilder: (context,index){
              return   CategoryWidget(
                  image: AppConsts.categoryList[index].image,
                  title: AppConsts.categoryList[index].name,
                  subtitle: AppConsts.categoryList[index].subTitle,
              );
            }
        ),
      ),
    );
  }
}
