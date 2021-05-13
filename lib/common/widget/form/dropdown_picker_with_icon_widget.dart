// import 'package:flutter/material.dart';

// /*
// DropdownPickerWithIcon(
//                 menuOptions: list of dropdown options in key value pairs,
//                 selectedOption: menu option string value,
//                 onChanged: (value) => print('changed'),
//               ),
// */
// class DropdownPickerWithIconWidget extends StatelessWidget {
//   const DropdownPickerWithIconWidget(
//       {this.menuOptions, this.selectedOption, this.onChanged});

//   final List<dynamic> menuOptions;
//   final String selectedOption;
//   final void Function(String) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     //if (Platform.isIOS) {}
//     return Container(
//       decoration: BoxDecoration(border: Border.all()),
//       child: DropdownButton<String>(
//           items: menuOptions
//               .map((dynamic data) => DropdownMenuItem<String>(
//                     value: data.key as String,
//                     child: Row(
//                       children: <Widget>[
//                         Icon(data.icon as IconData),
//                         const SizedBox(width: 10),
//                         Text(
//                           data.value as String,
//                         ),
//                       ],
//                     ),
//                   ))
//               .toList(),
//           value: selectedOption,
//           onChanged: onChanged),
//     );
//   }
// }
