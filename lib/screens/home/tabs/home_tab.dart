import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventry/models/featured_model.dart';
import 'package:eventry/models/firebase/event_category_model.dart';
import 'package:eventry/models/firebase/events_model.dart';
import 'package:eventry/resource/auth_methods.dart';
import 'package:eventry/resource/firestore_methods.dart';
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

class HomeTab extends ConsumerWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FeaturedModel> featured = ref.read(featuredProvider.state).state;
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
                  icon: FontAwesomeIcons.solidBookmark,
                  onPressed: () {
                    context.go('/${AppScreens.home.toPath}/${AppScreens.bookmark.toPath}');
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
        padding: EdgeInsets.symmetric(horizontal: size12.w),
        child: StreamBuilder(
          stream: FirestoreMethods().getAllEvents,
          builder: (BuildContext ctxEvents, AsyncSnapshot<dynamic> eventsSnapshot) {
            List<QueryDocumentSnapshot> events = [];
            if (eventsSnapshot.hasData) {
              events = eventsSnapshot.data.docs;
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
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
                            icon: FontAwesomeIcons.magnifyingGlass,
                            onPressed: null,
                            boxColor: getFadedBgColor(context),
                          )
                        ],
                      ),
                      SizedBox(height: size15.h),
                      headingRow(
                          ctx: context,
                          title:'Featured',
                          onPressed: () { context.go('/${AppScreens.home.toPath}/${AppScreens.featured.toPath}');},
                          clickText:'See all'
                      ),
                      SizedBox(height: size10.h),
                      SizedBox(
                        height: size125.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: featured.length > 3 ? 3 : featured.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FeaturedBannerWidget(
                              btnText: featured[index].btnText,
                              imagePath: featured[index].imagePath,
                              bannerName: featured[index].text,
                              onPressed: () {},
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: size15.w);
                          },
                        ),
                      ),
                      SizedBox(height: size15.h),
                      headingRow(
                          ctx: context,
                          title:'Trending',
                          onPressed: () {
                            ref.read(bottomNavigationCurrentIndexProvider.notifier).state = 1;
                          },
                          clickText:'See all'
                      ),
                      SizedBox(height: size10.h),
                      StreamBuilder(
                          stream: FirestoreMethods().allEventsCategories,
                          builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
                              List<EventCategoryModel> responseData = [];
                              if (!snapshot.hasData) {
                                return SizedBox(
                                  width: size20.w,
                                  height: size20.w,
                                  child: const CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.error != null) {
                                return const Center(child: Text('Some error occurred'));
                              }
                              final List<QueryDocumentSnapshot> data = snapshot.data.docs;
                              if (data.isNotEmpty) {
                                for (QueryDocumentSnapshot element in data) {
                                  final value = element.data() as Map<String, dynamic>;
                                  responseData.add(EventCategoryModel.fromJson(value));
                                }
                                ref.read(eventCategoriesProvider.notifier).updateList = responseData;
                              }
                              return SizedBox(
                              height: size30.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: responseData.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return BtnOutlined(
                                      btnRadius: size38,
                                      useFlexibleWith: true,
                                      child: Text(
                                        responseData[index].name.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onPressed: () {}
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(width: size12.w);
                                },
                              ),
                            );
                          }
                      ),
                      SizedBox(height: size25.h),
                    ],
                  ),
                ),
                events.isNotEmpty ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext ctx, int index) {
                          final EventsModel singleEvent = EventsModel.fromJson(events[index].data() as Map<String, dynamic>);
                          return EventListBoxWidget(singleEvent: singleEvent);
                        },
                      childCount: events.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 370,
                        childAspectRatio: 3/4,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 23
                    )
                ) : SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      width: size20.w,
                      height: size20.w,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: size60.h),
                )
              ],
            );
          }
        ),
      )
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
        Row(
          children: [
            Text(title,
              style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: size10.w),
            const FaIcon(FontAwesomeIcons.caretDown)
          ],
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(clickText)
        )
      ],
    );
  }
}
