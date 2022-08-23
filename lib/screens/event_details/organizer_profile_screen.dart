import 'package:eventry/widgets/appbar_with_no_actions.dart';
import 'package:flutter/material.dart';

class OrganizerProfileScreen extends StatelessWidget {
  const OrganizerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const AppBarWithNoActions(
          backPressed: null,
          title: 'Organizer',
        ),
      ),
    );
  }
}
