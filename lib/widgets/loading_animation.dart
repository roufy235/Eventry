import 'package:eventry/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  final Color color;
  final double height;
  const LoadingAnimation({Key? key, this.color = colorWhite, this.height = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color,
        size: height.h,
      ),
    );
  }
}
