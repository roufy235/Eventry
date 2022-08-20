import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';

class FeaturedBannerWidget extends StatelessWidget {
  final String imagePath, bannerName;
  final VoidCallback? onPressed;
  const FeaturedBannerWidget({
    Key? key,
    required this.imagePath,
    required this.bannerName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      width: size300.w,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(size12.r)
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size12.r),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    )
                )
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size12.r),
                color: brandColorDarkFaded.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: 25.h,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bannerName,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorWhite
                  ),
                ),
                SizedBox(height: size8.h),
                SizedBox(
                  width: size125.w,
                  child: BtnElevated(
                      btnHeight: size30,
                      btnRadius: size30,
                      onPressed: onPressed,
                      child: const Text('Book Now')
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
