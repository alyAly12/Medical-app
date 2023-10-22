import 'package:flutter/material.dart';
import 'package:medical_app/model/favorite_model.dart';
import 'package:uuid/uuid.dart';

class FavoriteProvider with ChangeNotifier
{
  final Map<String,FavoriteModel> _favoriteItem={};
   Map<String,FavoriteModel>get getFavoriteItem{
     return _favoriteItem;
   }
   void addOrRemoveFromFavoriteList({required String doctorId}){
     if(_favoriteItem.containsKey(doctorId)){
       _favoriteItem.remove(doctorId);
       notifyListeners();
     }
     _favoriteItem.putIfAbsent(doctorId, () => FavoriteModel(
         favoriteId:const Uuid().v4(), 
         doctorId: doctorId));
     notifyListeners();
   }

   bool isDoctorInFavorite({required String doctorId}){
    return _favoriteItem.containsKey(doctorId);
   }
   void clearLocalFavorite(){
     _favoriteItem.clear();
     notifyListeners();
   }
}
