import 'package:flutter/material.dart';
import 'package:medical_app/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';


class HeartButton extends StatelessWidget {
  const HeartButton({super.key, required this.bkColor, required this.size, required this.doctorId});
  final Color bkColor;
  final double size;
  final String doctorId;
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if(favoriteProvider.isDoctorInFavorite(doctorId: doctorId)){
            return favoriteProvider.clearLocalFavorite();
          }
          favoriteProvider.addOrRemoveFromFavoriteList(doctorId: doctorId);
        },
        child: Container(
          decoration:
          BoxDecoration(color:bkColor, shape: BoxShape.circle),
          child: Icon(
            favoriteProvider.isDoctorInFavorite(doctorId: doctorId)
            ?Icons.favorite:
            Icons.favorite_border_rounded,
            size:size,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
