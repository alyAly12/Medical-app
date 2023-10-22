import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/assets_manager.dart';

import '../widgets/subtitle_widget.dart';
import '../widgets/title_text_widget.dart';

class AppDialog {
  static Future<void> warningDialog(
      {required BuildContext context,
      required String text,
      required Function fun}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.warningPath,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 20,
                ),
                TitleTextWidget(
                  title: text,
                  maxLines: 3,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const TitleTextWidget(
                          title: 'Cancel',
                          color: Colors.green,
                        )),
                    TextButton(
                        onPressed: () {
                          fun();
                          Navigator.pop(context);
                        },
                        child: const TitleTextWidget(
                          title: 'OK',
                          color: Colors.red,
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> errorDialog(
      {required BuildContext context, required String text}) async {
    await showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.errorPath,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                SubtitleTextWidget(
                  subTitle: text,
                  maxLines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const TitleTextWidget(
                          title: 'OK',
                          color: Colors.green,
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFct,
    required Function galleryFct,
    required Function removeFct,
  }) async {
    await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Center(
              child: TitleTextWidget(title: 'Choose an option'),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        cameraFct();
                        if(Navigator.canPop(context)){
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.camera),
                      label: const TitleTextWidget(title: 'Camera')),
                  TextButton.icon(
                      onPressed: () {
                        galleryFct();
                        if(Navigator.canPop(context)){
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.image_outlined),
                      label: const TitleTextWidget(title: 'Gallery')),
                  TextButton.icon(
                      onPressed: () {
                        removeFct();
                        if(Navigator.canPop(context)){
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                      label: const TitleTextWidget(title: 'Remove')),
                ],
              ),
            ),
          );
        });
  }
}
