import 'package:flutter/material.dart';

class FavoriteModel with ChangeNotifier
{
  final String favoriteId;
  final String doctorId;

  FavoriteModel({required this.favoriteId,required this.doctorId});
}