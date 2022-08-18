import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/providers/state.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('hello world'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            BtnElevated(
                child: const Text('logout'),
                onPressed: () {
                  AuthMethods().logout();
                }
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                return Text(ref.read(userDataProvider.state).state.email.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
