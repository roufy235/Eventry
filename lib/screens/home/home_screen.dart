import 'package:eventry/config/config.dart';
import 'package:eventry/screens/home/tabs/home_tab.dart';
import 'package:eventry/screens/home/tabs/trending_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventry/providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ref.listen<dynamic>(bottomNavigationCurrentIndexProvider, (previous, next) {
      _pageController.jumpToPage(next);
    });
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            ref.read(bottomNavigationCurrentIndexProvider.state).state = index;
          },
          children: const [
            HomeTab(),
            TrendingTab(),
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
          selectedIndex: ref.watch(bottomNavigationCurrentIndexProvider.state).state,
          height: 70,
          elevation: 10.0,
          onDestinationSelected: (int index) {
            ref.read(bottomNavigationCurrentIndexProvider.notifier).state = index;
          },
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
