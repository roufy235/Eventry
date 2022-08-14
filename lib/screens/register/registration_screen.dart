import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/utils/myFunctions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
                  child: Text('Sign Up for Free',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        //color: getTextColor(context)
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                const TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 25.h),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 25.h),
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
                SizedBox(height: 25.h),
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
                SizedBox(height: 25.h),
                BtnElevated(
                    child: const Text('Sign Up'),
                    onPressed: () {}
                ),
                SizedBox(height: 30.h),
                const Text("Already a member?"),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.login.toPath}');
                    },
                    child: const Text('Login')
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text('or continue with',
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: getFadedBgColor(context),
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 20.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/facebook.png',
                                width: 22.w,
                                height: 22.w,
                              ),
                              SizedBox(width: 8.h),
                              Text('Facebook',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child:  InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: getFadedBgColor(context),
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 20.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                width: 22.w,
                                height: 22.w,
                              ),
                              SizedBox(width: 8.h),
                              Text('Google',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
