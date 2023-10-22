import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/app_consts/app_dialog.dart';
import 'package:medical_app/view_model/favorite_provider.dart';
import 'package:medical_app/widgets/doctors_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

class FavoriteDoctor extends StatelessWidget {
  const FavoriteDoctor({super.key});
static String id='favorite-screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: const TitleTextWidget(title: 'Favorites',color: Colors.white,),
        actions: [
          IconButton(onPressed: (){
           AppDialog.warningDialog(
               context: context,
               text: 'Are you sure ?',
               fun:(){
                 favoriteProvider.clearLocalFavorite();
               });
          },
              icon: const Icon(Icons.delete_outline,color: Colors.red,))
        ],
      ),
      body: favoriteProvider.getFavoriteItem.isEmpty
          ?const Center(child: TitleTextWidget(title: 'Favorite list is empty'),)
          : GridView.builder(
        itemCount:favoriteProvider.getFavoriteItem.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: size.width / (size.height * 0.75),
          ),
          itemBuilder:(context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorWidget(doctorId:favoriteProvider.getFavoriteItem.values.toList()[index].doctorId,),
            );
          }
      ),
    );
  }
}
