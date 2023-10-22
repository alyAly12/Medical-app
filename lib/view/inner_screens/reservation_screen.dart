import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';
import '../../view_model/reservation_provider.dart';
import '../appointmet/apppointment_widget.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});
  static String id = 'reservation_screen';
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: AppColors.lightPrimary,
        title: const TitleTextWidget(
          title: 'Your Reservation',
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: reservationProvider.getReservationItem.isEmpty
            ?const Center(child: TitleTextWidget(title: 'No Reservation Added'),)
            : ListView.builder(
            itemCount: reservationProvider.getReservationItem.length,
            itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChangeNotifierProvider.value(
                    value:reservationProvider.getReservationItem.values.toList()[index],
                    child: const AppointmentWidget()),
              );
            }),
      ),
    );
  }
}
