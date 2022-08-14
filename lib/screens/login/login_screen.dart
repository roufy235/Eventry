import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/utils/dimens.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: Text('Sign In to your Account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        //color: getTextColor(context)
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?')
                  ),
                ),
                SizedBox(height: 15.h),
                BtnElevated(
                    child: const Text('Sign In'),
                    onPressed: () {
                      context.go('/${AppScreens.home.toPath}');
                    }
                ),
                SizedBox(height: 40.h),
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.register.toPath}');
                    },
                    child: const Text('Register')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
