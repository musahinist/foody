// import 'dart:async';

// import 'package:flutter/material.dart';

// class CountDownTimerWidget extends StatefulWidget {
//   const CountDownTimerWidget(
//       {this.duration,
//       this.color,
//       this.radius,
//       this.strokeWidth,
//       this.onTimeIsUp});
//   final Color color;
//   final double radius;
//   final Duration duration;
//   final double strokeWidth;
//   final VoidCallback onTimeIsUp;

//   @override
//   _CountDownTimerWidgetState createState() => _CountDownTimerWidgetState();
// }

// class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
//   Timer _timer;
//   int start;

//   void startTimer() {
//     const Duration oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) => setState(
//         () {
//           if (start < 1) {
//             timer.cancel();
//             widget.onTimeIsUp();
//           } else {
//             start = start - 1;
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void initState() {
//     startTimer();
//     start = widget.duration.inSeconds;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           SizedBox(
//             height: widget.radius * 2,
//             width: widget.radius * 2,
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(start < 100
//                   ? start < 30
//                       ? Colors.red
//                       : Colors.amber
//                   : Colors.blue),
//               backgroundColor: Colors.transparent,
//               value: start / widget.duration.inSeconds,
//               strokeWidth: widget.strokeWidth,
//             ),
//           ),
//           Text(
//             // ignore: lines_longer_than_80_chars
//             "${(start / 60).floor()}:${(start % 60).toString().padLeft(2, "0")}",
//             textScaleFactor: widget.radius / 18,
//           )
//         ],
//       ),
//     );
//   }
// }
