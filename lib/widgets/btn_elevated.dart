import 'package:eventry/config/dimens.dart';
import 'package:eventry/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnElevated extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth;
  final bool isLoading;
  const BtnElevated({
    Key? key,
    required this.child,
    this.btnHeight = size38,
    this.btnWidth = double.infinity,
    this.isLoading = false,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: btnHeight.h,
      width: btnWidth.w,
      child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? LoadingAnimation(color: primaryColor) : child
      ),
    );
  }
}
