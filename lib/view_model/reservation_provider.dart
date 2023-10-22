import 'package:flutter/material.dart';
import 'package:medical_app/model/reservation_model.dart';
import 'package:uuid/uuid.dart';

class ReservationProvider with ChangeNotifier
{
  final Map<String,ReservationModel>_reservationItem={};
  Map<String,ReservationModel>get getReservationItem{
    return _reservationItem;
  }
  void addDoctorToReservation({required String doctorId}){
    _reservationItem.putIfAbsent(doctorId, () => ReservationModel(
        doctorId: doctorId,
        reservationId:const Uuid().v4()
    )
    );
    notifyListeners();
  }
  bool isDoctorReserved({required String doctorId}){
    return _reservationItem.containsKey(doctorId);
  }

}