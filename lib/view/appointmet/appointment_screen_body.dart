import 'package:flutter/material.dart';
import 'package:medical_app/view/appointmet/apppointment_widget.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/reservation_provider.dart';


class AppointmentScreenBody extends StatelessWidget {
  const AppointmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(title: 'Your appointment :',fontSize: 22,),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                itemCount: reservationProvider.getReservationItem.length,
                itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChangeNotifierProvider.value(
                    value:reservationProvider.getReservationItem.values.toList()[index],
                    child: const AppointmentWidget()),
              );
            }),
          )
        ],
      ),
    );
  }
}
