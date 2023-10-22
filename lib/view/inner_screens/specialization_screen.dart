import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/model/doctors_model.dart';
import 'package:medical_app/view_model/doctors_provider.dart';
import 'package:medical_app/widgets/doctors_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String id = 'search-screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final doctorProvider = Provider.of<DoctorsProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<DoctorsModel> doctorList = passedCategory == null
        ? doctorProvider.doctors
        : doctorProvider.findDoctorByCategory(cateName: passedCategory);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: TitleTextWidget(
          title:passedCategory!,
          color:Colors.white ,
        ),
        centerTitle: true,
      ),
      body: doctorList.isEmpty
          ? const Center(
              child: TitleTextWidget(title: 'No Doctors found'),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        itemCount: doctorList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height * 0.75),
                            crossAxisSpacing: 12),
                        itemBuilder: (context, index) {
                          return DoctorWidget(
                            doctorId: doctorList[index].doctorId,
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
