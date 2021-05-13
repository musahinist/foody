// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:pattern_lock/pattern_lock.dart';

// import '../util/dialog_util.dart';
// import '../util/storage_util.dart';
// import 'primary_button_widget.dart';

// class LocalAuthWidget extends StatefulWidget {
//   // final String buttonLabel;
//   final Widget child;
//   final Function onSuccess;
//   final Function onFailure;

//   const LocalAuthWidget({Key key, this.onSuccess, this.onFailure, this.child})
//       : super(key: key);
//   @override
//   _LocalAuthWidgetState createState() => _LocalAuthWidgetState();
// }

// class _LocalAuthWidgetState extends State<LocalAuthWidget> {
//   final LocalAuthentication localAuth = LocalAuthentication();
//   bool _canCheckBiometrics;
//   List<BiometricType> _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;

//   Future<void> _checkBiometrics() async {
//     bool canCheckBiometrics;
//     try {
//       canCheckBiometrics = await localAuth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometrics = canCheckBiometrics;
//     });
//   }

//   Future<void> _getAvailableBiometrics() async {
//     List<BiometricType> availableBiometrics;
//     try {
//       availableBiometrics = await localAuth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _availableBiometrics = availableBiometrics;
//     });
//   }

//   Future<void> _authenticate() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await localAuth.authenticateWithBiometrics(
//           localizedReason: 'Scan your fingerprint to authenticate',
//           useErrorDialogs: true,
//           stickyAuth: true);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Authenticating';
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     final String message = authenticated ? 'Authorized' : 'Not Authorized';

//     setState(() {
//       _authorized = message;
//       if (authenticated) {
//         widget.onSuccess();
//       } else {
//         widget.onFailure();
//       }
//     });
//   }

//   void _cancelAuthentication() {
//     localAuth.stopAuthentication();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _checkBiometrics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       //  labelText: _isAuthenticating ? 'Cancel' : widget.buttonLabel,
//       child: widget.child,
//       onTap: () async {
//         // final hasPattern = await StorageUtil.getPattern() == null;
//         // _settingModalBottomSheet(context, hasPattern);

//         if (_canCheckBiometrics) {
//           await _getAvailableBiometrics();
//           _isAuthenticating ? _cancelAuthentication() : await _authenticate();
//         } else {
//           final hasPattern = await StorageUtil.getPattern() == null;
//           _settingModalBottomSheet(context, hasPattern);
//         }
//       },
//     );
//   }

//   void _settingModalBottomSheet(context, bool hasPattern) {
//     showModalBottomSheet(
//       context: context,
//       enableDrag: false,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext bc) {
//         return Container(
//           margin: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           // TODO: check pattern setted from secure sorage
//           //if not setted
//           child: hasPattern
//               ? SetPattern()
//               : CheckPattern(
//                   onSuccess: widget.onSuccess, onFailure: widget.onFailure),
//           //else
//           //
//         );
//       },
//     );
//   }
// }

// class SetPattern extends StatefulWidget {
//   @override
//   _SetPatternState createState() => _SetPatternState();
// }

// class _SetPatternState extends State<SetPattern> {
//   bool isConfirm = false;
//   List<int> pattern;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.transparent,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Flexible(
//             child: Text(
//               isConfirm ? "Confirm pattern" : "Draw pattern",
//               style: TextStyle(fontSize: 26),
//             ),
//           ),
//           Flexible(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: PatternLock(
//                 selectedColor: Colors.amber,
//                 relativePadding: .2,
//                 pointRadius: 10,
//                 onInputComplete: (List<int> input) {
//                   if (input.length < 3) {
//                     DialogUtil.showSnackbar(
//                       keyScaffold: scaffoldKey,
//                       content: "At least 3 points required",
//                     );

//                     return;
//                   }
//                   if (isConfirm) {
//                     if (listEquals<int>(input, pattern)) {
//                       StorageUtil.savePattern(pattern.join());
//                       Navigator.of(context).pop(pattern);
//                     } else {
//                       DialogUtil.showSnackbar(
//                         keyScaffold: scaffoldKey,
//                         content: "Patterns do not match",
//                       );
//                       setState(() {
//                         pattern = null;
//                         isConfirm = false;
//                       });
//                     }
//                   } else {
//                     setState(() {
//                       pattern = input;
//                       isConfirm = true;
//                     });
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CheckPattern extends StatelessWidget {
//   final Function onSuccess;
//   final Function onFailure;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   CheckPattern({Key key, this.onSuccess, this.onFailure}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ModalRoute.of(context).settings.arguments as List<int>;
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.transparent,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Flexible(
//             child: Text(
//               "Draw Your pattern",
//               style: TextStyle(fontSize: 26),
//             ),
//           ),
//           Flexible(
//             child: PatternLock(
//               selectedColor: Colors.red,
//               pointRadius: 8,
//               showInput: true,
//               dimension: 3,
//               relativePadding: 0.1,
//               selectThreshold: 25,
//               fillPoints: true,
//               onInputComplete: (List<int> input) async {
//                 if (input.join() == await StorageUtil.getPattern()) {
//                   //if correct call onSucces or not call onFailure
//                   onSuccess();
//                   //   Navigator.of(context).pop(true);
//                 } else {
//                   DialogUtil.showSnackbar(
//                     keyScaffold: scaffoldKey,
//                     content: "wrong pattern",
//                   );
//                   // onFailure();
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
