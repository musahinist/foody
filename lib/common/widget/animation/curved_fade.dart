import 'package:flutter/material.dart';

class CurvedFade extends StatefulWidget {
  // CurvedFade({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _CurvedFade createState() => _CurvedFade();
}

class _CurvedFade extends State<CurvedFade> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FadeTransition(
            opacity: curve,
            child: const FlutterLogo(
              size: 100.0,
            ),
          ),
          FloatingActionButton(
            tooltip: 'Fade',
            onPressed: () {
              controller.forward();
            },
            child: const Icon(Icons.brush),
          ),
        ],
      ),
    );
  }
}
