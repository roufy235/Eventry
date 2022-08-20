import 'package:eventry/config/config.dart';
import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: FaIcon(FontAwesomeIcons.solidUser, size: 15.h),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          //indicatorColor: Colors.blue.shade200,
          backgroundColor: getScaffoldColor(context),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
          height: 70,
          elevation: 10.0,
          destinations: [
            NavigationDestination(
              label: 'Home',
              icon: FaIcon(FontAwesomeIcons.house, size: 15.h),
              selectedIcon: FaIcon(FontAwesomeIcons.house, size: 15.h),
            ),
            NavigationDestination(
              label: 'Trending',
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck, size: 15.h),
              selectedIcon: FaIcon(FontAwesomeIcons.solidCalendarCheck, size: 15.h),
            ),
            NavigationDestination(
              label: 'Calendar',
              icon: FaIcon(FontAwesomeIcons.solidCalendar, size: 15.h),
              selectedIcon: FaIcon(FontAwesomeIcons.solidCalendar, size: 15.h),
            ),
            NavigationDestination(
              label: 'Map',
              icon: FaIcon(FontAwesomeIcons.solidMap, size: 15.h),
              selectedIcon: FaIcon(FontAwesomeIcons.solidMap, size: 15.h),
            )
          ],
        ),
      ),
    );
  }
}
