import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/utils/my_functions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final StateProvider _isLoadingProvider = StateProvider<int>((ref) => 0);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  void createAccountFunc(WidgetRef ref) async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    if (validateString(context, 'name is required', name)) {
      if (validateString(context, 'phone is required', phone)) {
        if (validateString(context, 'email is required', email)) {
          if (validateString(context, 'password is required', password)) {
            ref.read(_isLoadingProvider.notifier).state = 1;
            String response = await AuthMethods().createAccount(
                phone: phone,
                email: email,
                password: password,
                name: name
            );
            if (response != 'success') {
              ref.read(_isLoadingProvider.notifier).state = 0;
              if (!mounted) return;
              customSnackBar(context, response);
            }
          }
        }
      }
    }
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
                  child: Text('Sign Up for Free',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        //color: getTextColor(context)
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 25.h),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone',
                    //errorText: errorTextPassword,
                    //border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 25.h),
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
                SizedBox(height: 25.h),
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
                SizedBox(height: 25.h),
                Consumer(
                  builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                    int value = ref.watch(_isLoadingProvider.state).state;
                    return BtnElevated(
                      onPressed: () => createAccountFunc(ref),
                      isLoading: value == 1,
                      child: const Text('Sign Up'),

                    );
                  }
                ),
                SizedBox(height: 20.h),
                const Text("Already a member?"),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.login.toPath}');
                    },
                    child: const Text('Login')
                ),
                SizedBox(height: 10.h),
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
                SizedBox(height: 10.h),
                InkWell(
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
                        Image.asset('assets/images/apple.png',
                          width: 22.w,
                          height: 22.w,
                        ),
                        SizedBox(width: 8.h),
                        Text('Apple',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
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
