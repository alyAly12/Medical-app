import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/app_consts/assets_manager.dart';
import 'package:medical_app/view_model/reservation_provider.dart';
import 'package:medical_app/widgets/empty_screen.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import 'appointment_screen_body.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});
  static String id = 'appointment-screen';
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return reservationProvider.getReservationItem.isEmpty
        ? EmptyScreen(
            title: 'No Appointment found',
            img: AssetsManager.appointment,
            subTitle: 'Make an Appointment')
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightPrimary,
              title: const TitleTextWidget(
                title: 'Schedule',
                fontSize: 22,
              ),
              actions: const [
                Icon(
                  Icons.calendar_month_sharp,
                  size: 22,
                  color: Colors.white,
                )
              ],
            ),
            body: const AppointmentScreenBody(),
          );
  }
}
