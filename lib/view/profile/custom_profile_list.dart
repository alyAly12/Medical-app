import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../widgets/subtitle_widget.dart';

class CustomProfileList extends StatelessWidget {
  const CustomProfileList({
    super.key,
    required this.imagePath,
    required this.title,
    required this.fun,
  });
  final String imagePath;
  final String title;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        fun();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(subTitle: title),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
