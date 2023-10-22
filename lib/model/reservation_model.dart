import 'package:flutter/material.dart';

class ReservationModel with ChangeNotifier
{
  final String doctorId;
  final String reservationId;

  ReservationModel({required this.doctorId,required this.reservationId});
}