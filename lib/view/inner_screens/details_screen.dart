import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/view_model/doctors_provider.dart';
import 'package:medical_app/view_model/theme_provider.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';
import '../../app_consts/app_color.dart';
import '../../view_model/reservation_provider.dart';
import '../../widgets/subtitle_widget.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static String id = 'details-screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final doctorProvider = Provider.of<DoctorsProvider>(context);
    String? doctorId  = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentDoctor = doctorProvider.findDoctorById(doctorId);
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: TitleTextWidget(title: 'About',color: themeProvider.getDarkTheme?Colors.white:Colors.black,)
      ),
      body:getCurrentDoctor ==null
          ?const SizedBox.shrink()
          :Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl:
                   getCurrentDoctor.doctorImage,
                    height: size.height * 0.4,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TitleTextWidget(title: getCurrentDoctor.doctorTitle),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleTextWidget(
                      title: 'About ',
                      fontSize: 24,
                    ),
                    SubtitleTextWidget(
                      subTitle: 'In ${getCurrentDoctor.doctorCategory}',
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SubtitleTextWidget(
                  subTitle: getCurrentDoctor.doctorDescription,
                  maxLines: 40,
                ),
                const SizedBox(height: 30,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TitleTextWidget(title: '122',color: AppColors.lightPrimary,),
                        SizedBox(height: 10,),
                        TitleTextWidget(title: 'Patient')
                      ],
                    ),
                    Column(
                      children: [
                        TitleTextWidget(title: '7',color: AppColors.lightPrimary),
                        SizedBox(height: 10,),
                        TitleTextWidget(title: 'Experience')
                      ],
                    ),
                    Column(
                      children: [
                        TitleTextWidget(title: '1001',color: AppColors.lightPrimary),
                        SizedBox(height: 10,),
                        TitleTextWidget(title: 'Followers')
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),



                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 2
                          ),
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: ()  {
                      if(reservationProvider.isDoctorReserved(doctorId: doctorId)){
                        return;
                      }
                     reservationProvider.addDoctorToReservation(doctorId: doctorId);
                    },
                    icon:Icon(
                      reservationProvider.isDoctorReserved(doctorId: doctorId)
                          ?Icons.check
                          :Icons.calendar_month_sharp,
                      color: AppColors.lightPrimary,
                    ),
                    label:TitleTextWidget(
                      title:reservationProvider.isDoctorReserved(doctorId: doctorId)
                          ?'Booked 👍'
                          :'Book Appointment',
                      color: AppColors.lightPrimary,
                    )),
              ],
            ),
      ),
          ),
    ) ;
  }
}
