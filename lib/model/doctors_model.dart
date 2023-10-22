import 'package:flutter/cupertino.dart';

class DoctorsModel with ChangeNotifier {
  final String doctorId;
  final String doctorTitle;
  final String doctorDescription;
  final String doctorCategory;
  final String doctorImage;


  DoctorsModel(
      {required this.doctorId,
      required this.doctorTitle,
      required this.doctorDescription,
      required this.doctorCategory,
      required this.doctorImage,
      });
}
