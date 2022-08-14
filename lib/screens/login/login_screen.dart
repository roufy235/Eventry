import 'package:eventry/utils/dimens.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/myFunctions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w
            ),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: SvgPicture.asset('assets/images/logo_dark.svg',
                    fit: BoxFit.cover,
                    width: 50.w,
                    height: 50.w,
                  ),
                ),
                SizedBox(height: 30.h),
                Text('Sign In to your Account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: getTextColor(context)
                  ),
                ),
                SizedBox(height: 30.h),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email address',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 30.h),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 30.h),
                BtnElevated(
                    child: const Text('Sign In'),
                    onPressed: () {}
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: defaultBtnHeight.h,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?')
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
