import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventry/router/router.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class EventListBoxWidget extends StatelessWidget {
  final String imageLink;
  const EventListBoxWidget({Key? key, required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size12.r),
        color: getFadedBgColor(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => context.go('/${AppScreens.home.toPath}/${AppScreens.eventDetails.toPath}?eventImageName=$imageLink'),
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 100.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size12.r),
                        topRight: Radius.circular(size12.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageLink,
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
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size5.r),
                        color: brandColorDarkFaded.withOpacity(0.5),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: size10.w,
                          vertical: size5.w
                      ),
                      child: Text('17 Dec',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: colorWhite
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size8.h),
          Text('Tech Conference',
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: size5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Text('20k+ Going',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          SizedBox(height: size5.h),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size8.w
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot,
                        size: 12.sp,
                      ),
                      SizedBox(width: size5.w),
                      Text('Eko Hotel',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SizedBox(width: size5.w),
                InkWell(
                  child: FaIcon(FontAwesomeIcons.bookmark,
                    size: 12.sp,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
