import 'package:flutter/material.dart';
import 'package:medical_app/model/viewed_recently_model.dart';
import 'package:uuid/uuid.dart';

class ViewedRecentlyProvider with ChangeNotifier
{
  final Map<String ,ViewedRecentlyModel> _historyItem={};
  Map<String ,ViewedRecentlyModel>get getHistoryItem{
    return _historyItem;
  }
  void addToHistory({required String doctorId}){
    _historyItem.putIfAbsent(doctorId,
            () => ViewedRecentlyModel(
                historyId:const Uuid().v4(),
                doctorId: doctorId)
    );
    notifyListeners();
  }
  void clearLocalHistory(){
    _historyItem.clear();
    notifyListeners();
  }

}