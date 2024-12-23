import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.height,
    required this.color,
    required this.width,

    this.padLeft,
    this.padRight,
    this.padVert,
  });
  final double width;
  final double height;
  final Color color;
  final double? padVert;
  final double? padLeft;
  final double? padRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: padLeft??0,
          right: padRight??0,
          top: padVert ?? 0,
          bottom: padVert ?? 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
