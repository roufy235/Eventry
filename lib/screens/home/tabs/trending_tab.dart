import 'package:eventry/providers/state.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:eventry/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingTab extends ConsumerWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            ref.read(bottomNavigationCurrentIndexProvider.state).state = 0;
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Trending',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            ClickIcon(
              iconColor: getTextColor(context),
              icon: Icons.search,
              onPressed: null,
              boxColor: getFadedBgColor(context),
            )
          ],
        ),
      ),
    );
  }
}
