import 'package:flutter/material.dart';

class LabeledRadioWidget extends StatelessWidget {
  const LabeledRadioWidget({
    required this.label,
    required this.padding,
    this.groupValue,
    this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final dynamic groupValue;
  final dynamic value;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Radio<dynamic>(
                  groupValue: groupValue, value: value, onChanged: onChanged),
            ),
            Flexible(
              flex: 4,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
