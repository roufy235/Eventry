import 'package:eventry/config/config.dart';
import 'package:eventry/models/featured_model.dart';
import 'package:eventry/widgets/appbar_with_no_actions.dart';
import 'package:eventry/widgets/featured_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/providers/providers.dart';

class FeaturedScreen extends ConsumerWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FeaturedModel> featured = ref.read(featuredProvider.state).state;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const AppBarWithNoActions(
            title: 'Featured',
          ),
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size15.w,
        ),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: featured.length,
              itemBuilder: (BuildContext ctx, int index) {
                return SizedBox(
                  height: size125.h,
                  child: FeaturedBannerWidget(
                    btnText: featured[index].btnText,
                    imagePath: featured[index].imagePath,
                    bannerName: featured[index].text,
                    onPressed: () {},
                  ),
                );
              },
            separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: size20.h);
            },
          )
      ),
    );
  }
}
