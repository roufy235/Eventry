import 'package:eventry/widgets/btn_elevated.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateTicketScreen extends StatelessWidget {
  const GenerateTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket',
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size15.w,
            vertical: size10.h
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: size15.w,
                      vertical: size25.h
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0,
                          color: getScaffoldColor(context)
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(size20.r),
                          bottomRight: Radius.circular(size12.r)
                      )
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Tech Concert',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: size18.sp
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: size20.h),
                    Center(
                      child: QrImage(
                        backgroundColor: getQRCodeBgColor(context),
                        data: 'This is a simple QR code',
                        version: QrVersions.auto,
                        size: 250,
                        gapless: false,
                      ),
                    ),
                    SizedBox(height: size20.h),
                    const Divider(),
                    SizedBox(height: size20.h),
                    getCol(context, 'Name', 'Augustina Mayowa'),
                    SizedBox(height: size20.h),
                    Row(
                      children: [
                        Expanded(
                          child: getCol(context, 'Date', 'Dec 20, 2022'),
                        ),
                        SizedBox(width: size8.w),
                        Expanded(
                          child: getCol(context, 'Time', '9am - 3pm'),
                        )
                      ],
                    ),
                    SizedBox(height: size20.h),
                    getCol(context, 'Location', '374 Dawson Station Rd.'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size18.w
          ),
          child: Row(
            children: [
              Expanded(
                child: BtnElevated(
                    child: const Text('Download Ticket'),
                    onPressed: () {}
                ),
              ),
              SizedBox(width: size12.w),
              Expanded(
                child: BtnOutlined(
                    child: const Text('Close'),
                    onPressed: () {}
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCol(BuildContext ctx, String heading, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading,
          style: Theme.of(ctx).textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(content,
          style: Theme.of(ctx).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: size13.sp
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
