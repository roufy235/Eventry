import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback? onBtnPressed;
  final String title, content, iconPath, btnText;
  const CustomDialog({
    Key? key,
    required this.onBtnPressed,
    required this.title,
    required this.content,
    this.iconPath = checkMark,
    required this.btnText}) : super(key: key
  );

  Widget dialogContent(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      height: 260.h,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
          color: getBgColor(context),
          borderRadius: BorderRadius.circular(30.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath,
            width: 70.w,
            height: 70.h,
          ),
          SizedBox(height: 20.h),
          Text(title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          Text(content,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 120.w
            ),
            child: BtnElevated(
                onPressed: onBtnPressed,
                child: Text(btnText)
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.w),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
