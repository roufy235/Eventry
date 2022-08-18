import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueWithWidget extends StatelessWidget {
  const ContinueWithWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appLogoString = Theme.of(context).brightness == Brightness.light ? appleIconDark : appleIconLight;
    ScreenUtil.init(context);
    return Column(
      children: [
        Center(
          child: Text(continueWithText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            Expanded(
              child:  InkWell(
                onTap: () {},
                child: containerBox(context, facebookIcon, facebookTxt),
              ),
            ),
            SizedBox(width: size10.w),
            Expanded(
              child:  InkWell(
                onTap: () async {
                  try {
                    // : TODO google hasn't verified this app
                    //final response = await _googleSignIn.signIn();
                  } catch(_) {}
                },
                child: containerBox(context, googleIcon, googleTxt),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () {},
          child: containerBox(context, appLogoString, appleTxt),
        ),
      ],
    );
  }

  Widget containerBox(BuildContext ctx, String iconPath, String iconName) {
    return Container(
      decoration: BoxDecoration(
          color: getFadedBgColor(ctx),
          borderRadius: BorderRadius.circular(size10.r)
      ),
      padding: EdgeInsets.symmetric(
          vertical: size12.h,
          horizontal: size20.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,
            width: size22.w,
            height: size22.w,
          ),
          SizedBox(width: size8.h),
          Text(iconName,
            textAlign: TextAlign.center,
            style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
