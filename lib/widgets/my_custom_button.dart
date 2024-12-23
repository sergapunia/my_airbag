import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  MyCustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    this.border,
    this.borderColor,
    this.textColor,
    this.icon,
    this.iconColor,
  });
  String title;
  Function onTap;
  bool? border;
  Color backgroundColor;
  Color? borderColor;
  Color? textColor;
  Color? iconColor;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: border != null
              ? Border.all(
                  color: borderColor ?? Colors.white,
                  width: 1.5,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor ?? Colors.white,
                size: 24,
              ),
            Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
