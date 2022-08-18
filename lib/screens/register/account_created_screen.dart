import 'package:eventry/config/functions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:eventry/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/images/success.svg',
                width: 150.w,
                height: 150.w,
              ),
            ),
            SizedBox(height: 30.h),
            Text('Congrats!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: getTextColor(context)
              ),
            ),
            SizedBox(height: 10.h),
            Text('Your account is ready to use.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 250.w,
              child: BtnElevated(
                  child: const Text('Continue'),
                  onPressed: () {
                    context.go('/${AppScreens.interest.toPath}');
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
