// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BackButtonControllerWidget extends StatelessWidget {
//   const BackButtonControllerWidget({
//     Key? key,
//     required this.child,
//     this.exitOnBackTapped = true,
//     this.callbackOnBackButtonTapped,
//     this.returnValue=true,
//   })  : assert(child != null),
//         assert(exitOnBackTapped != null),
//         super(key: key);

//   final Widget child;
//   final bool exitOnBackTapped;
//   final VoidCallback? callbackOnBackButtonTapped;
//   final bool returnValue;

//   // ignore: missing_return
//   Future<bool> _onWillPop() async {
//     if (exitOnBackTapped) {
//        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//     }
//     if (callbackOnBackButtonTapped != null) {
//       callbackOnBackButtonTapped!();
//     }
//     if (returnValue != null) {
//       return returnValue;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: child,
//     );
//   }
// }
