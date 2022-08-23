import 'package:eventry/widgets/appbar_with_no_actions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:go_router/go_router.dart';
import 'package:eventry/router/router.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const AppBarWithNoActions(
          backPressed: null,
          title: 'Payment',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size15.w
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pay with Debit Card',
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: size13.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Add New Card')
                )
              ],
            ),
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
              horizontal: size18.w
          ),
          child: BtnElevated(
              child: const Text('Continue'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return CustomDialog(
                          onBtnPressed: () {
                            Navigator.pop(dialogContext);
                            context.go('/${AppScreens.generateTicket.toPath}');
                          },
                          title: "Payment Successful",
                          content: 'Voila! Your have successfully booked seat for this event.',
                          btnText: 'View Ticket'
                      );
                    }
                );
              }
          ),
        ),
      ),
    );
  }
}
