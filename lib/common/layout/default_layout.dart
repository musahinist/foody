import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({Key? key, required this.appBar, required this.body})
      : super(key: key);
  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      // backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Center(
          child: body,
        ),
      ),
    );
  }
}
