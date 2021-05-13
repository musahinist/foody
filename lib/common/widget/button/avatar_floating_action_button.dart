import 'package:flutter/material.dart';

class AvatarFloatingActionButton extends StatefulWidget {
  const AvatarFloatingActionButton({Key? key, required this.onTap})
      : super(key: key);

  final Function onTap;

  @override
  _AvatarFloatingActionButtonState createState() =>
      _AvatarFloatingActionButtonState();
}

class _AvatarFloatingActionButtonState
    extends State<AvatarFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'User Avatar Image',
      elevation: 0,
      backgroundColor: Colors.amber,
      onPressed: () {},
      child: const CircleAvatar(
        radius: 28,
        backgroundColor: Colors.amber,
        child: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('asset/image/default_profile.png'),
        ),
      ),
    );
  }
}
