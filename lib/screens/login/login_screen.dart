import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/utils/utils.dart';
import 'package:eventry/router/router.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/continue_with_widget.dart';
import 'package:eventry/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:eventry/config/config.dart';

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
  void initState() {
    super.initState();
    String? recentLoginEmail = HiveRepository().getSaveRecentLoginEmail;
    if (recentLoginEmail != null) {
      _emailController.text = recentLoginEmail;
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
              horizontal: size30.w
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size30.h),
                Center(
                  child: SvgPicture.asset(appLogo,
                    fit: BoxFit.cover,
                    width: 50.w,
                    height: 50.w,
                  ),
                ),
                SizedBox(height: size30.h),
                Center(
                  child: Text(signInText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        //color: getTextColor(context)
                    ),
                  ),
                ),
                SizedBox(height: size30.h),
                AppTextField(
                    controller: _emailController,
                    labelText: emailText,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email
                ),
                SizedBox(height: size30.h),
                AppTextField(
                    obscureText: true,
                    controller: _passwordController,
                    labelText: passwordText,
                    keyboardType: TextInputType.text,
                    icon: Icons.lock
                ),
                SizedBox(height: size20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(forgotPasswordText)
                  ),
                ),
                SizedBox(height: size15.h),
                Consumer(
                  builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                    int isLoginBtnLoading = ref.watch(_isLoginBtnLoadingProvider.state).state;
                    return BtnElevated(
                        isLoading: isLoginBtnLoading == 1,
                        child: const Text(signInTxt),
                        onPressed: () async {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          if (context.validateString(emailErr, email)) {
                            if (context.validateString(passwordErr, password)) {
                              ref.read(_isLoginBtnLoadingProvider.state).state = 1;
                              String res = await AuthMethods().signInUser(
                                  email: email,
                                  password: password,
                              );
                              ref.read(_isLoginBtnLoadingProvider.state).state = 0;
                              if (res == 'success') {
                                await HiveRepository().saveRecentLoginEmail(email);
                                if (!mounted) return;
                                context.go('/${AppScreens.home.toPath}');
                              } else {
                                if (!mounted) return;
                                context.customSnackBar(res);
                              }
                            }
                          }
                        }
                    );
                  }
                ),
                SizedBox(height: size20.h),
                const Text(newMemberText),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.register.toPath}');
                    },
                    child: const Text(signUpTxt)
                ),
                SizedBox(height: size20.h),
                const ContinueWithWidget(),
                SizedBox(height: size30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
