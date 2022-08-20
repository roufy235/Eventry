import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClickIcon extends StatelessWidget {
  final Color boxColor, iconColor;
  final double boxRadius;
  final IconData icon;
  final VoidCallback? onPressed;
  const ClickIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    required this.boxColor,
    this.boxRadius = size10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size38.w,
        height: size38.w,
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(boxRadius.r)
        ),
        child: Center(
          child: FaIcon(icon, color: iconColor, size: 20.sp,),
        ),
      ),
    );
  }
}
