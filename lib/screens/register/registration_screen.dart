import 'package:eventry/config/config.dart';
import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/router/router.dart';
import 'package:eventry/utils/utils.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/continue_with_widget.dart';
import 'package:eventry/widgets/text_field.dart';
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
    if (context.validateString(nameErr, name)) {
      if (context.validateString(phoneErr, phone)) {
        if (context.validateString(emailErr, email)) {
          if (context.validateString(passwordErr, password)) {
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
              context.customSnackBar(response);
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
                horizontal: size30.w
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size30.h),
                Center(
                  child: SvgPicture.asset(appLogo,
                    fit: BoxFit.cover,
                    width: size50.w,
                    height: size50.w,
                  ),
                ),
                SizedBox(height: size30.h),
                Center(
                  child: Text(signUpText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        //color: getTextColor(context)
                    ),
                  ),
                ),
                SizedBox(height: size25.h),
                AppTextField(
                    controller: _nameController,
                    labelText: nameText,
                    keyboardType: TextInputType.text,
                    icon: Icons.person
                ),
                SizedBox(height: size25.h),
                AppTextField(
                    controller: _phoneController,
                    labelText: phoneText,
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone
                ),
                SizedBox(height: size25.h),
                AppTextField(
                    controller: _emailController,
                    labelText: emailText,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email
                ),
                SizedBox(height: size25.h),
                AppTextField(
                  obscureText: true,
                    controller: _passwordController,
                    labelText: passwordText,
                    keyboardType: TextInputType.text,
                    icon: Icons.lock
                ),
                SizedBox(height: size25.h),
                Consumer(
                  builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                    int value = ref.watch(_isLoadingProvider.state).state;
                    return BtnElevated(
                      onPressed: () => createAccountFunc(ref),
                      isLoading: value == 1,
                      child: const Text(signUpTxt),

                    );
                  }
                ),
                SizedBox(height: size20.h),
                const Text(alreadyAMemberText),
                TextButton(
                    onPressed: () {
                      context.go('/${AppScreens.login.toPath}');
                    },
                    child: const Text(signInTxt)
                ),
                SizedBox(height: size10.h),
                const ContinueWithWidget(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
