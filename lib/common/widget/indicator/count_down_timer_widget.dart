// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class CountDownTimerWidget extends StatefulWidget {
//   const CountDownTimerWidget({Key? key, required this.minute})
//       : super(key: key);

//   final int minute;

//   @override
//   _CountDownTimerWidgetState createState() => _CountDownTimerWidgetState();
// }

// class _CountDownTimerWidgetState extends State<CountDownTimerWidget>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(minutes: widget.minute),
//     )..forward(from: 1.0);
//   }

//   String get timerString {
//     final Duration duration = controller.duration * controller.value;
//     // ignore: lines_longer_than_80_chars
//     return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 30,
//       height: 30,
//       child: AnimatedBuilder(
//         animation: controller,
//         builder: (BuildContext context, Widget child) {
//           return Padding(
//             padding: const EdgeInsets.all(0),
//             child: Stack(
//               children: <Widget>[
//                 CustomPaint(
//                   painter: CustomTimerPainter(
//                     animation: controller,
//                     backgroundColor: Colors.blue,
//                   ),
//                 ),
//                 Text(
//                   timerString,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CustomTimerPainter extends CustomPainter {
//   CustomTimerPainter({
//     this.animation,
//     this.backgroundColor,
//     this.color,
//   }) : super(repaint: animation);

//   final Animation<double> animation;
//   final Color backgroundColor, color;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = backgroundColor
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.butt
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(Offset.zero, 10, paint);
//     paint.color = color;
//     final double progress = (1.0 - animation.value) * 2 * math.pi;
//     canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
//   }

//   @override
//   bool shouldRepaint(CustomTimerPainter old) {
//     return animation.value != old.animation.value ||
//         color != old.color ||
//         backgroundColor != old.backgroundColor;
//   }
// }
