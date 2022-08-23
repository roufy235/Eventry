import 'package:eventry/router/router.dart';
import 'package:eventry/widgets/appbar_with_no_actions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const AppBarWithNoActions(
          backPressed: null,
          title: 'Buy Ticket',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size15.w
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size12.h),
            Text('Ticket Type',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: size13.sp
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: size12.h),
            Row(
              children: [
                Expanded(
                  child: BtnOutlined(
                      child: const Text('Vip'),
                      onPressed: () {}
                  ),
                ),
                SizedBox(width: size10.w),
                Expanded(
                  child: BtnElevated(
                      child: const Text('Economy'),
                      onPressed: () {}
                  ),
                )
              ],
            ),
            SizedBox(height: size12.h),
            Text('Seat',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: size13.sp
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: size12.h),
            const Divider(),
            SizedBox(height: size12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClickIcon(
                  iconColor: getTextColor(context),
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {},
                  boxColor: getFadedBgColor(context),
                ),
                Text('1',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: size13.sp
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ClickIcon(
                  iconColor: getTextColor(context),
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {},
                  boxColor: getFadedBgColor(context),
                )
              ],
            ),
            SizedBox(height: size12.h),
            const Divider(),
            SizedBox(height: size12.h),
            Center(
              child: Text('Total NGN 3,000',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: size18.sp
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size12.w
          ),
          child: BtnElevated(
              child: const Text('Continue'),
              onPressed: () {
                context.go('/${AppScreens.home.toPath}/${AppScreens.eventDetails.toPath}/${AppScreens.checkout.toPath}/${AppScreens.checkoutPayment.toPath}');
              }
          ),
        ),
      ),
    );
  }
}
