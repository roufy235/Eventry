import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWithNoActions extends StatelessWidget {
  final VoidCallback? backPressed;
  final String title;
  const AppBarWithNoActions({
    Key? key,
    required this.title,
    this.backPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: backPressed ?? () {
          context.pop();
        },
      ),
      centerTitle: false,
      title: Text(title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
