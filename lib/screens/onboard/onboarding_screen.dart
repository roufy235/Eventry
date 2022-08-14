import 'package:eventry/models/onboarding_model.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/screens/onboard/dot_indicator.dart';
import 'package:eventry/screens/onboard/onboarding_layout.dart';
import 'package:eventry/utils/colors.dart';
import 'package:eventry/utils/dimens.dart';
import 'package:eventry/utils/myFunctions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> _models = <OnboardingModel>[
    OnboardingModel(
        title: 'Explore Upcoming and Nearby Events',
        image: 'assets/images/banner.jpg',
        imageLight: 'assets/images/bannerLight.jpg',
        content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    ),
    OnboardingModel(
        title: 'Easily Add Events to Your Calendar',
        image: 'assets/images/banner_two.jpeg',
        imageLight: 'assets/images/banner_light_two.jpg',
        content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    ),
    OnboardingModel(
        title: 'Instantly Search for Events Around You with Map',
        image: 'assets/images/banner_three.jpg',
        imageLight: 'assets/images/banner_light_three.jpg',
        content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    )
  ];

  final PageController _controller = PageController(initialPage: 0);

  int _pageIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  String _next = 'Next';

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);
    return Scaffold(
        body: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
                if (index == (_models.length - 1)) {
                  _next = 'Get Stated';

                }
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: _models.length,
            itemBuilder: (BuildContext context, int index) {
              return OnboardingLayout(
                data: _models[index],
              );
            }
        ),
      bottomNavigationBar: Container(
        color: getBgColor(context),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h
        ),
        height: 125.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(_models.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  );
                }),
              ],
            ),
            SizedBox(height: 5.h),
            SizedBox(
              height: defaultBtnHeight.h,
              width: double.infinity,
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Skip')
              ),
            ),
            SizedBox(height: 5.h),
            BtnElevated(
                child: Text(_next),
                onPressed: () {
                  if (_models.length == (_pageIndex + 1)) {
                    context.go('/${AppScreens.welcome.toPath}');
                  } else {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease
                    );
                  }
                }
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
