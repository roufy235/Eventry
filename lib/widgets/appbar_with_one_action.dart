import 'package:eventry/config/config.dart';
import 'package:eventry/widgets/click_icon.dart';
import 'package:flutter/material.dart';

class AppBarWithOneAction extends StatelessWidget {
  final VoidCallback? backPressed, actionOnePressed;
  final String title;
  final List<IconData> actionIcons;
  const AppBarWithOneAction({
    Key? key,
    required this.title,
    required this.actionIcons,
    required this.backPressed,
    required this.actionOnePressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: backPressed,
      ),
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
          ClickIcon(
            iconColor: getTextColor(context),
            icon: actionIcons[0],
            onPressed: actionOnePressed,
            boxColor: getFadedBgColor(context),
          )
        ],
      ),
    );
  }
}
