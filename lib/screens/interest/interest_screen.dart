import 'package:eventry/models/interest_model.dart';
import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:eventry/providers/providers.dart';
import 'package:eventry/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class InterestScreen extends ConsumerWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interestIds = ref.watch(interestIdsStateNotifierProvider);
    final List<InterestModel> interests = ref.read(interestProvider.state).state;
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text(selectYourInterest),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: 10.w,
          left: 10.w,
          bottom: 10.h,
        ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 370,
                childAspectRatio: 3/2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13
            ),
            itemCount: interests.length,
            itemBuilder: (BuildContext ctx, int index) {
              return InkWell(
                onTap: () {
                  int selectedId = interests[index].id;
                  ref.read(interestIdsStateNotifierProvider.notifier).updateData = selectedId;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: interestIds.contains(interests[index].id) ? brandColor : getFadedBgColor(context),
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(interests[index].icon,
                        color: interestIds.contains(interests[index].id) ? colorWhite : getTextColor(context),
                        size: 40.sp,
                      ),
                      SizedBox(height: 8.h),
                      Text(interests[index].text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: interestIds.contains(interests[index].id) ? colorWhite : getTextColor(context),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: BtnElevated(
            onPressed: interestIds.isNotEmpty ? () {
              context.go('/${AppScreens.home.toPath}');
            } : null,
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }
}
