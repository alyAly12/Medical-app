import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/model/reservation_model.dart';
import 'package:provider/provider.dart';

import '../../app_consts/app_color.dart';
import '../../view_model/doctors_provider.dart';
import '../../view_model/reservation_provider.dart';
import '../../widgets/title_text_widget.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorsProvider>(context);
    final reservationModelProvider = Provider.of<ReservationModel>(context);
    final getCurrentDoctor =
        doctorProvider.findDoctorById(reservationModelProvider.doctorId);
    final reservationProvider = Provider.of<ReservationProvider>(context);
    Size size = MediaQuery.of(context).size;

    return getCurrentDoctor == null
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightPrimary, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl:
                          getCurrentDoctor.doctorImage,
                      height: size.height * 0.2,
                      width: size.height * 0.15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          child:  TitleTextWidget(
                            title: getCurrentDoctor.doctorTitle,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         TitleTextWidget(
                          title:getCurrentDoctor.doctorCategory,
                          color: AppColors.lightPrimary,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child:  TitleTextWidget(
                            title: 'Reservation date :',
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: const TitleTextWidget(
                            title: 'Time : 11:00',
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
