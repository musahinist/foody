import 'package:flutter/material.dart';

class ButtonToggleOutlineStadiumWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonToggleOutlineStadiumWidget(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: ButtonStyle(

              //  backgroundColor: MaterialStateProperty.all(Colors.amber),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20)))),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.amber))
              // foregroundColor: MaterialStateProperty.all(Colors.amber),
              ),
          onPressed: onPressed,
          child: Text(title),
        ),
        OutlinedButton(
          style: ButtonStyle(

              //  backgroundColor: MaterialStateProperty.all(Colors.amber),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(20)))),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.amber))
              // foregroundColor: MaterialStateProperty.all(Colors.amber),
              ),
          onPressed: onPressed,
          child: Text(title),
        ),
      ],
    );
  }
}
