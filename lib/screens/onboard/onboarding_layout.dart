import 'package:eventry/models/onboarding_model.dart';
import 'package:eventry/config/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingLayout extends StatelessWidget {
  final OnboardingModel data;
  const OnboardingLayout({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageHeight = 600.h;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light ? data.imageLight : data.image,
            fit: BoxFit.cover,
            height: imageHeight
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w
            ),
            decoration: BoxDecoration(
                //color: getBgColor(context),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.4,
                  0.7,
                  1.0,
                ],
                colors: <Color>[
                  Colors.transparent,
                  getBgColor(context),
                  getBgColor(context)
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(data.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: getTextColor(context)
                  ),
                ),
                SizedBox(height: 16.h),
                Text(data.content,
                    textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 13.sp
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
