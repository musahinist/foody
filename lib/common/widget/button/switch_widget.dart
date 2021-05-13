import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget(
      {Key? key,
      required this.label,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final String label;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
          inactiveTrackColor: Colors.lightBlueAccent,
          inactiveThumbColor: Colors.blue,
          // activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.amber,
        ),
      ],
    );
  }
}
