// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../config/app_asset.dart';
// import '../config/localizations.dart';
// import '../util/screen_util.dart';

// class ConnectivityWidget extends StatelessWidget {
//   final Widget child;

//   const ConnectivityWidget({Key key, this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final _labels = AppLocalizations.of(context);
//     return OfflineBuilder(
//       connectivityBuilder: (
//         BuildContext context,
//         ConnectivityResult connectivity,
//         Widget child,
//       ) {
//         if (connectivity == ConnectivityResult.none) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(_labels.offlinePage.title),
//               centerTitle: true,
//               automaticallyImplyLeading: false,
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 24.0),
//                     child: SizedBox(
//                         height: ScreenUtil().setHeight(600),
//                         width: ScreenUtil().setWidth(600),
//                         child: SvgPicture.asset(
//                           Assets.no_signal_min,
//                           fit: BoxFit.contain,
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       _labels.offlinePage.message,
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return child;
//         }
//       },
//       builder: (BuildContext context) {
//         return Center(child: child);
//       },
//     );
//   }
// }
