import 'package:eventry/providers/state.dart';
import 'package:eventry/widgets/appbar_with_one_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrendingTab extends ConsumerWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWithOneAction(
          backPressed: () {
            ref.read(bottomNavigationCurrentIndexProvider.state).state = 0;
          },
          title: 'Trending',
          actionIcons: const [FontAwesomeIcons.magnifyingGlass],
          actionOnePressed: () {  },
        ),
      )
    );
  }
}
