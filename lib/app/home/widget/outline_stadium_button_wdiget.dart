import 'package:flutter/material.dart';

class ButtonOutlineStadiumWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonOutlineStadiumWidget(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          //  backgroundColor: MaterialStateProperty.all(Colors.amber),
          shape: MaterialStateProperty.all(const StadiumBorder()),
          side: MaterialStateProperty.all(const BorderSide(color: Colors.amber))
          // foregroundColor: MaterialStateProperty.all(Colors.amber),
          ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
