import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(appName,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            Row(
              children: [
                ClickIcon(
                  iconColor: getTextColor(context),
                  icon: Icons.notifications,
                  onPressed: null,
                  boxColor: getFadedBgColor(context),
                ),
                SizedBox(width: size8.w),
                ClickIcon(
                    iconColor: getTextColor(context),
                    icon: Icons.logout_sharp,
                    boxColor: getFadedBgColor(context),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Logout'),
                              content: const Text('are you sure?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('cancel')
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      AuthMethods().logout();
                                    },
                                    child: const Text('logout')
                                )
                              ],
                            );
                          }
                      );
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
