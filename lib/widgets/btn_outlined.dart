import 'package:eventry/config/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnOutlined extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth, btnRadius;
  const BtnOutlined({
    Key? key,
    required this.child,
    this.btnRadius = defaultBtnRadius,
    this.btnHeight = size38,
    this.btnWidth = double.infinity,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight.h,
      width: btnWidth.w,
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
            ),
          ),
          onPressed: onPressed,
          child: child
      ),
    );
  }
}
