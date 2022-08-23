import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:eventry/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrganizerProfileScreen extends StatelessWidget {
  const OrganizerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Organizer'),
            centerTitle: false,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            pinned: true,
            toolbarHeight: AppBar().preferredSize.height,
            expandedHeight: size250.h,
            backgroundColor: getScaffoldColor(context),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(height: size80.h),
                  const ProfileImageWidget(
                      imageUrl: 'https://picsum.photos/200',
                    radius: size45,
                  ),
                  SizedBox(height: size8.h),
                  Text('Augustina Mayowa',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: size20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size20.w
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getCol(context, 'Followers', '300'),
                        getCol(context, 'Following', '34'),
                        getCol(context, 'Events', '12')
                      ],
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
                    children: [
                      Expanded(
                        child: BtnOutlined(
                            child: const Text('Message'),
                            onPressed: () {}
                        ),
                      ),
                      SizedBox(width: size10.w),
                      Expanded(
                        child: BtnElevated(
                            child: const Text('Follow'),
                            onPressed: () {}
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size10.h),
                  const Divider(),
                  SizedBox(height: size10.h),
                  Row(
                    children: [
                      Expanded(
                        child: BtnElevated(
                            btnHeight: size25.h,
                            btnRadius: size50,
                            useFlexibleWith: true,
                            child: Text('About',
                              style: TextStyle(fontSize: size12.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {}
                        ),
                      ),
                      SizedBox(width: size10.w),
                      Expanded(
                        child: BtnOutlined(
                            btnHeight: size25.h,
                            btnRadius: size50,
                            useFlexibleWith: true,
                            child: Text('Events',
                              style: TextStyle(fontSize: size12.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {}
                        ),
                      ),
                      SizedBox(width: size10.w),
                      Expanded(
                        child: BtnOutlined(
                            btnHeight: size25.h,
                            btnRadius: size50,
                            useFlexibleWith: true,
                            child: Text('Reviews',
                              style: TextStyle(fontSize: size12.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {}
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size10.h),
                  Text('About',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: size13.sp,
                      fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size5.h),
                  Text(loremIpsum,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getCol(BuildContext ctx, String title, String text) {
    return Column(
      children: [
        Text(text,
          style: Theme.of(ctx).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: size18.sp
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(title,
          style: Theme.of(ctx).textTheme.bodySmall!.copyWith(
            fontSize: size13.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
