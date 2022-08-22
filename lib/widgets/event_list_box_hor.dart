import 'package:eventry/widgets/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventListHorBoxWidget extends StatelessWidget {
  final String imageLink;
  const EventListHorBoxWidget({Key? key, required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      width: double.infinity,
      height: 110.h,
      child: Row(
        children: [
          Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 110.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size12.r),
                      bottomLeft: Radius.circular(size12.r),
                    ),
                    child: Image.network(imageLink,
                      fit: BoxFit.cover,
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
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: size10.w,
                  right: size10.w
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0,
                      color: getScaffoldColor(context)
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(size12.r),
                      bottomRight: Radius.circular(size12.r)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size10.h),
                  Text('Tech Conference',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: size15.sp
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  BtnOutlined(
                      btnHeight: size15.h,
                      btnRadius: size38,
                      btnWidth: size45.w,
                      child: Text('music',
                        style: TextStyle(fontSize: 8.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {}
                  ),
                  const Spacer(),
                  Text('20k+ Going',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
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
                  SizedBox(height: size12.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
