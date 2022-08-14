import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/myFunctions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final StateProvider _isLoginBtnLoadingProvider = StateProvider((ref) => 0);


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email address',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 30.h),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
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
                Consumer(
                  builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                    int isLoginBtnLoading = ref.watch(_isLoginBtnLoadingProvider.state).state;
                    return BtnElevated(
                        isLoading: isLoginBtnLoading == 1 ? true : false,
                        child: const Text('Sign In'),
                        onPressed: () async {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          if (validateString(context, 'email is required', email)) {
                            if (validateString(context, 'password is required', password)) {
                              ref.read(_isLoginBtnLoadingProvider.state).state = 1;
                              String res = await AuthMethods().signInUser(email: email, password: password);
                              ref.read(_isLoginBtnLoadingProvider.state).state = 0;
                              if (res != 'success') {
                                if (!mounted) return;
                                customSnackBar(context, res);
                              }
                            }
                          }

                          //context.go('/${AppScreens.interest.toPath}');
                        }
                    );
                  }
                ),
                SizedBox(height: 20.h),
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.register.toPath}');
                    },
                    child: const Text('Register')
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
