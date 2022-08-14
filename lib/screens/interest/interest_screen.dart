import 'package:eventry/models/interest_model.dart';
import 'package:eventry/router/app_screens.dart';
import 'package:eventry/router/app_screens_ext.dart';
import 'package:eventry/states/state.dart';
import 'package:eventry/utils/colors.dart';
import 'package:eventry/utils/myFunctions.dart';
import 'package:eventry/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

final List<InterestModel> interest = <InterestModel>[
  InterestModel(id: 1, text: 'Art', icon: FontAwesomeIcons.clipboard),
  InterestModel(id: 2, text: 'Music', icon: FontAwesomeIcons.music),
  InterestModel(id: 3, text: 'Sport', icon: FontAwesomeIcons.football),
  InterestModel(id: 4, text: 'Food', icon: FontAwesomeIcons.burger),
  InterestModel(id: 5, text: 'Party', icon: FontAwesomeIcons.champagneGlasses),
  InterestModel(id: 6, text: 'Technology', icon: FontAwesomeIcons.microchip),
];

class InterestScreen extends ConsumerWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interestIds = ref.watch(interestIdsStateNotifierProvider);
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Select your Interest'),
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
            itemCount: interest.length,
            itemBuilder: (BuildContext ctx, int index) {
              return InkWell(
                onTap: () {
                  int selectedId = interest[index].id;
                  ref.read(interestIdsStateNotifierProvider.notifier).updateData = selectedId;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: interestIds.contains(interest[index].id) ? brandColor : getFadedBgColor(context),
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(interest[index].icon,
                        color: interestIds.contains(interest[index].id) ? colorWhite : getTextColor(context),
                        size: 40.sp,
                      ),
                      SizedBox(height: 8.h),
                      Text(interest[index].text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: interestIds.contains(interest[index].id) ? colorWhite : getTextColor(context),
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
