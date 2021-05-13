import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    required this.labelText,
    required this.onPressed,
    required this.color,
    this.shape,
    this.padding,
  });
  final Color color;
  final ShapeBorder? shape;
  final String labelText;
  final VoidCallback onPressed;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: onPressed,
        shape: shape ?? const StadiumBorder(),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: padding ?? 24),
        color: color,
        child: Center(
          child: Text(
            labelText.toUpperCase(),
            style: Theme.of(context).textTheme.button,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
