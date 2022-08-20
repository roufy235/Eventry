import 'package:eventry/models/interest_model.dart';
import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/router/router.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:eventry/widgets/event_list_box.dart';
import 'package:eventry/widgets/featured_banner.dart';
import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventry/providers/providers.dart';
import 'package:go_router/go_router.dart';

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
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            Row(
              children: [
                ClickIcon(
                  iconColor: getTextColor(context),
                  icon: FontAwesomeIcons.solidBell,
                  onPressed: () {
                    context.go('/${AppScreens.home.toPath}/${AppScreens.notification.toPath}');
                  },
                  boxColor: getFadedBgColor(context),
                ),
                SizedBox(width: size8.w),
                ClickIcon(
                    iconColor: getTextColor(context),
                    icon: FontAwesomeIcons.arrowRightFromBracket,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size12.w
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: size10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size10.w
                          ),
                          height: 33.h,
                          decoration: BoxDecoration(
                              color: getFadedBgColor(context),
                              borderRadius: BorderRadius.circular(size20.r)
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'search',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size8.w),
                      ClickIcon(
                        iconColor: getTextColor(context),
                        icon: FontAwesomeIcons.barsStaggered,
                        onPressed: null,
                        boxColor: getFadedBgColor(context),
                      )
                    ],
                  ),
                  SizedBox(height: size15.h),
                  headingRow(
                      ctx: context,
                      title:'Featured',
                      onPressed: () { },
                      clickText:'See all'
                  ),
                  SizedBox(height: size10.h),
                  SizedBox(
                    height: size125.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FeaturedBannerWidget(
                          imagePath: internationalConcert,
                          bannerName: 'International Concert',
                          onPressed: () {},
                        ),
                        SizedBox(width: size12.w),
                        FeaturedBannerWidget(
                          imagePath: localConcert,
                          bannerName: 'Local Concert',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size15.h),
                  headingRow(
                      ctx: context,
                      title:'Trending',
                      onPressed: () { },
                      clickText:'See all'
                  ),
                  SizedBox(height: size10.h),
                  SizedBox(
                    height: size30.h,
                    child: Consumer(
                        builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                          List<InterestModel> cates = ref.read(interestProvider.state).state;
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: cates.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return BtnOutlined(
                                  btnRadius: size38,
                                  btnWidth: size60.w,
                                  child: Text(cates[index].text),
                                  onPressed: () {}
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(width: size12.w);
                            },
                          );
                        }
                    ),
                  ),
                  SizedBox(height: size25.h),
                ],
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                      return EventListBoxWidget(
                        imageLink: 'https://picsum.photos/seed/${index + 20}/400/200',
                      );
                    },
                  childCount: 10,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 370,
                    childAspectRatio: 3/4,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 23
                )
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: size60.h),
            )
          ],
        ),
      ),
    );
  }

  Widget headingRow({
    required BuildContext ctx,
    required String title,
    required VoidCallback onPressed,
    required String clickText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: Theme.of(ctx).textTheme.headline6,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(clickText)
        )
      ],
    );
  }
}
