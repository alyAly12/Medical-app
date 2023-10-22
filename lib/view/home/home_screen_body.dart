import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/view_model/doctors_provider.dart';
import 'package:medical_app/widgets/doctors_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import '../../model/doctors_model.dart';



class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  List<DoctorsModel> doctorSearchList = [];
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorsProvider>(context);
    String? passedCategory =
    ModalRoute.of(context)!.settings.arguments as String?;
    List<DoctorsModel> doctorList = passedCategory == null
        ? doctorProvider.doctors
        : doctorProvider.findDoctorByCategory(cateName: passedCategory);
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height*0.22,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.lightPrimary,
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(12) ,
              bottomLeft: Radius.circular(12) ,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextWidget(title: 'Welcome',color: Colors.white,fontSize: 23,),
                const SizedBox(height: 20,),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'search',
                    hintStyle: const TextStyle(
                      color: AppColors.lightPrimary
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    prefixIcon:  const Icon(Icons.search,color:AppColors.lightPrimary,),
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(Icons.clear, color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                      setState(() {
                        doctorSearchList = doctorProvider.searchQuery(
                            searchText: searchController.text, passList: doctorList);
                      });
                  },
                  onChanged: (value) {
                    setState(() {
                      doctorSearchList = doctorProvider.searchQuery(
                          searchText: searchController.text, passList: doctorList);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (searchController.text.isNotEmpty &&
            doctorSearchList.isEmpty) ...[
          const Center(
            child: TitleTextWidget(title: 'no products found'),
          )
        ],
        Expanded(
          child: GridView.builder(
            itemCount: searchController.text.isNotEmpty?doctorSearchList.length :doctorList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: size.width / (size.height * 0.70),
              ),
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DoctorWidget(
                    doctorId: searchController.text.isNotEmpty
                        ? doctorSearchList[index].doctorId
                        : doctorList[index].doctorId,
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
