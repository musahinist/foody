import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  const FormCard({Key? key, required this.children, this.color})
      : super(key: key);

  final List<Widget> children;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color ?? Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16)),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
