import 'package:eventry/widgets/appbar_with_one_action.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: AppBarWithOneAction(
            backPressed: () {
              context.pop();
            },
            title: 'Notifications',
            actionIcons: const [FontAwesomeIcons.ellipsisVertical],
            actionOnePressed: () {  },
          ),
        )
    );
  }
}
