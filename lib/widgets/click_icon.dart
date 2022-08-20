import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickIcon extends StatelessWidget {
  final Color boxColor, iconColor;
  final double boxPadding, boxRadius;
  final IconData icon;
  final VoidCallback? onPressed;
  const ClickIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    required this.boxColor,
    this.boxPadding = size8,
    this.boxRadius = size10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(boxPadding.w),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(boxRadius.r)
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
