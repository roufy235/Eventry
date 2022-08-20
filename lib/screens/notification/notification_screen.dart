import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
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
                icon: FontAwesomeIcons.ellipsisVertical,
                onPressed: null,
                boxColor: getFadedBgColor(context),
              )
            ],
          ),
        )
    );
  }
}
