import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/app_consts/app_color.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickImage, required this.fun});
  final XFile? pickImage;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:pickImage ==null? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.lightPrimary
                  )
              ),
            ):Image.file(File(pickImage!.path),fit: BoxFit.fill,),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                fun();
              },
              child: const Padding(
                padding:  EdgeInsets.all(6.0),
                child:  Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
