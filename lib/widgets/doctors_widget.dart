import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/view/inner_screens/details_screen.dart';
import 'package:medical_app/view_model/doctors_provider.dart';
import 'package:medical_app/widgets/heart_button.dart';
import 'package:medical_app/widgets/subtitle_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import '../view_model/viewed_recently_provider.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.doctorId});
  final String doctorId;
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorsProvider>(context);
    final getCurrentDoctor = doctorProvider.findDoctorById(doctorId);
    final viewedProvider = Provider.of<ViewedRecentlyProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getCurrentDoctor == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () async{
              viewedProvider.addToHistory(doctorId: getCurrentDoctor.doctorId);
              await Navigator.pushNamed(context, DetailsScreen.id,arguments: getCurrentDoctor.doctorId);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              color: Colors.white60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                          imageUrl: getCurrentDoctor.doctorImage,
                        height: size.height * 0.23,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     TitleTextWidget(title: getCurrentDoctor.doctorTitle),
                     Flexible(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SubtitleTextWidget(subTitle: getCurrentDoctor.doctorCategory),
                           HeartButton(bkColor: Colors.transparent, size: 20, doctorId: doctorId)
                         ],
                       ),
                     )
                  ],
                ),
              ),
            ),
          );
  }
}
