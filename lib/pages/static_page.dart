import 'package:flutter/material.dart';

class StaticScreens extends StatelessWidget {
  const StaticScreens({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(pageName),
      ),
    );
  }
}
