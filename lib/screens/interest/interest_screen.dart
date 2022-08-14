import 'package:flutter/material.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Select your Interest'),
      ),
    );
  }
}
