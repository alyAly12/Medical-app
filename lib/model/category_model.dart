import 'package:flutter/foundation.dart';

class CategoryModel with ChangeNotifier
{
  final String id;
  final String name;
  final String subTitle;
  final String image;

  CategoryModel({required this.id,required this.name,required this.subTitle,required this.image});
}