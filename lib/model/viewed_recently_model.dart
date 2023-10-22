import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier
{
  final String historyId;
  final String doctorId;

  ViewedRecentlyModel({required this.historyId,required this.doctorId});
}