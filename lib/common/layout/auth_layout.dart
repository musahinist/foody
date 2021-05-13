import 'package:flutter/material.dart';

import '../widget/util_widget/keyboard_hider_widget.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan,
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: <Color>[Colors.amber, Colors.purple],
        //   ),
        // ),
        child: SafeArea(
          child: KeyboardHider(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
