import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.maxLines,
    this.color,
    this.fontStyle = FontStyle.italic,
    this.fontWeight = FontWeight.w700,
  });
  final String title;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight),
    );
  }
}
