import 'package:flutter/material.dart';

class ProfilePictureAtom extends StatelessWidget {
  const ProfilePictureAtom(
      {Key? key, this.radius, this.tickness, required this.color})
      : super(key: key);
  final double? radius;
  final double? tickness;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 24,
      backgroundColor: color,
      child: CircleAvatar(
        radius: (radius ?? 24) - (tickness ?? 2),
        backgroundImage:
            const NetworkImage('https://www.fillmurray.com/100/100'),
      ),
    );
  }
}
