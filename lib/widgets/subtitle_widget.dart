import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.subTitle,
    this.fontSize = 16,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textDecoration = TextDecoration.none,
    this.maxLines = 2,
  });
  final String subTitle;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      maxLines: maxLines,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          decoration: textDecoration,
          fontStyle: fontStyle),
    );
  }
}
