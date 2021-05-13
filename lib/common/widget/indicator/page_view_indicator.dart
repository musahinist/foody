// import 'package:flutter/material.dart';

// class PageViewIndicator extends StatelessWidget {
//   const PageViewIndicator({Key key, this.currentIndex, this.index, this.count})
//       : super(key: key);
//   final int currentIndex;
//   final int index;
//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(
//           count,
//           (index) {
//             double size = currentIndex == index ? 8 : 6;
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               margin: EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                   color: currentIndex == index ? Colors.blue : Colors.grey,
//                   borderRadius: BorderRadius.circular(size / 2)),
//               width: size,
//               height: size,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
