import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/appbar_with_no_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantDiscussionScreen extends StatelessWidget {
  const ParticipantDiscussionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const AppBarWithNoActions(
          backPressed: null,
          title: 'Participant Discussion',
        ),
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size15.w,
            vertical: size10.h
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size8.w,
              vertical: size8.h
            ),
            decoration: BoxDecoration(
                //color: getFadedBgColor(context),
                border: Border.all(
                    width: 2.0,
                    color: getScaffoldColor(context)
                ),
                borderRadius: BorderRadius.circular(size10.r)
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Type message...',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: size5.w),
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.paperPlane,
                      color: getTextColor(context),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
