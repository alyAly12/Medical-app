import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/view_model/viewed_recently_provider.dart';
import 'package:medical_app/widgets/doctors_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import '../../app_consts/app_dialog.dart';

class ViewedRecently extends StatelessWidget {
  const ViewedRecently({super.key});
  static String id = 'ViewedRecentlyScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewedProvider = Provider.of<ViewedRecentlyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary,
        title: const TitleTextWidget(
          title: 'History',
          color: Colors.white,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                AppDialog.warningDialog(
                    context: context,
                    text: 'Are you sure',
                    fun: (){
                      viewedProvider.clearLocalHistory();
                    });
              },
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ))
        ],
      ),
      body: viewedProvider.getHistoryItem.isEmpty
          ?const Center(child: TitleTextWidget(title: 'History is empty'),)
          : GridView.builder(
          itemCount:viewedProvider.getHistoryItem.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: size.width / (size.height * 0.75),
          ),
          itemBuilder:(context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorWidget(doctorId:viewedProvider.getHistoryItem.values.toList()[index].doctorId,),
            );
          }
      )
    );
  }
}
