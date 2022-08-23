import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventry/router/router.dart';

class EventDetailsScreen extends ConsumerWidget {
  final String? eventImageName;
  const EventDetailsScreen({
    Key? key,
    required this.eventImageName
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios, color: getBgColor(context)),
            ),
            pinned: true,
            toolbarHeight: AppBar().preferredSize.height,
            expandedHeight: 200.h,
            backgroundColor: getTextColor(context),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Tech Conference'),
              background: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: CachedNetworkImage(
                      imageUrl: eventImageName ?? 'https://picsum.photos/seed/21/500/400',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) {
                        return Center(
                          child: SizedBox(
                            height: size20.w,
                            width: size20.w,
                            child: CircularProgressIndicator(value: downloadProgress.progress),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size15.w,
                vertical: size15.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BtnOutlined(
                          btnHeight: size15.h,
                          btnRadius: size38,
                          useFlexibleWith: true,
                          child: Text('music',
                            style: TextStyle(fontSize: 8.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onPressed: () {}
                      ),
                      SizedBox(width: size5.w),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext ctx) {
                                return Container(
                                  height: 400.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size15.w,
                                    vertical: size15.h
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('20k+ Going',
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size15.sp
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: size20.h),
                                      Expanded(
                                        child: ListView.separated(
                                            itemCount: 10,
                                            itemBuilder: (BuildContext bCtx, int index) {
                                              return Row(
                                                children: [
                                                  CachedNetworkImage(
                                                    progressIndicatorBuilder: (context, url, downloadProgress) {
                                                      return CircleAvatar( // or
                                                          backgroundColor: getFadedBgColor(context),
                                                          radius: size20.r,// any widget that use imageProvider like (PhotoView)
                                                          child: SizedBox(
                                                            height: size10.w,
                                                            width: size10.w,
                                                            child: CircularProgressIndicator(value: downloadProgress.progress),
                                                          )
                                                      );
                                                    },
                                                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                                    fit: BoxFit.cover,
                                                    imageUrl: 'https://picsum.photos/200',
                                                    imageBuilder: (context, imageProvider) { // you can access to imageProvider
                                                      return CircleAvatar( // or
                                                        radius: size20.r,// any widget that use imageProvider like (PhotoView)
                                                        backgroundImage: imageProvider,
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(width: size10.w),
                                                  Expanded(
                                                    child: Text('Augustina Mayowa',
                                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: size13.sp
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          separatorBuilder: (BuildContext context, int index) {
                                              return SizedBox(height: size10.h);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        child: Text('20k+ Going',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClickIcon(
                        iconColor: getTextColor(context),
                        icon: FontAwesomeIcons.calendar,
                        onPressed: () {},
                        boxColor: getFadedBgColor(context),
                      ),
                      SizedBox(width: size15.h),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('December 17 2022',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.bold,
                                fontSize: size13.sp
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('Saturday, 2:00pm - 6:00pm',
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: size5.h),
                            BtnOutlined(
                                btnHeight: size18.h,
                                btnRadius: size38,
                                useFlexibleWith: true,
                                child: Text('add to calendar',
                                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onPressed: () {}
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClickIcon(
                        iconColor: getTextColor(context),
                        icon: FontAwesomeIcons.locationPin,
                        onPressed: () {},
                        boxColor: getFadedBgColor(context),
                      ),
                      SizedBox(width: size15.h),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Eko Hotel',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size13.sp
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('374 Dawson Station Rd',
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: size5.h),
                            BtnOutlined(
                                btnHeight: size18.h,
                                btnRadius: size38,
                                useFlexibleWith: true,
                                child: Text('see on map',
                                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onPressed: () {}
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, downloadProgress) {
                          return CircleAvatar( // or
                            backgroundColor: getFadedBgColor(context),
                            radius: size20.r,// any widget that use imageProvider like (PhotoView)
                            child: SizedBox(
                              height: size10.w,
                              width: size10.w,
                              child: CircularProgressIndicator(value: downloadProgress.progress),
                            )
                          );
                        },
                        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                        fit: BoxFit.cover,
                        imageUrl: 'https://picsum.photos/200',
                        imageBuilder: (context, imageProvider) { // you can access to imageProvider
                          return CircleAvatar( // or
                            radius: size20.r,// any widget that use imageProvider like (PhotoView)
                            backgroundImage: imageProvider,
                          );
                        },
                      ),
                      SizedBox(width: size10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Augustina Mayowa',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size13.sp
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('Organizer',
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: size10.w),
                      BtnOutlined(
                          btnHeight: size18.h,
                          btnRadius: size38,
                          useFlexibleWith: true,
                          child: Text('follow',
                            style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onPressed: () {}
                      ),
                    ],
                  ),
                  SizedBox(height: size15.h),
                  const Divider(),
                  Text('About Event',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: size13.sp
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size5.h),
                  Text(loremIpsum,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: size15.h),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      context.go('/${AppScreens.home.toPath}/${AppScreens.eventDetails.toPath}/${AppScreens.eventDetailsDiscussion.toPath}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: getFadedBgColor(context),
                          borderRadius: BorderRadius.circular(size10.r)
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: size10.h,
                          horizontal: size20.w
                      ),
                      child: const Text('Participant Discussion'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size15.w,
            vertical: size8.h
          ),
          child: Row(
            children: [
              ClickIcon(
                iconColor: getTextColor(context),
                icon: FontAwesomeIcons.shareNodes,
                onPressed: () {},
                boxColor: getFadedBgColor(context),
              ),
              SizedBox(width: size15.w),
              ClickIcon(
                iconColor: getTextColor(context),
                icon: FontAwesomeIcons.bookmark,
                onPressed: () {},
                boxColor: getFadedBgColor(context),
              ),
              SizedBox(width: size15.w),
              Expanded(
                child: BtnElevated(
                  onPressed: () {  },
                  child: const Text('Buy Ticket'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
