import 'package:eventry/models/firebase/event_category_model.dart';
import 'package:eventry/providers/state.dart';
import 'package:eventry/widgets/appbar_with_one_action.dart';
import 'package:eventry/widgets/btn_outlined.dart';
import 'package:eventry/widgets/event_list_box_hor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventry/config/config.dart';

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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size10.w
        ),
        child: Column(
          children: [
            SizedBox(height: size8.h),
            SizedBox(
              height: size30.h,
              child: Consumer(
                  builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                    List<EventCategoryModel> cates = ref.read(eventCategoriesProvider.notifier).getDate;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cates.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return BtnOutlined(
                            btnRadius: size38,
                            useFlexibleWith: true,
                            child: Text(
                              cates[index].name.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {}
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: size12.w);
                      },
                    );
                  }
              ),
            ),
            SizedBox(height: size12.h),
            Expanded(
              child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, int index) {
                    return EventListHorBoxWidget(imageLink: 'https://picsum.photos/seed/${index + 500}/200/300');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: size12.h);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
