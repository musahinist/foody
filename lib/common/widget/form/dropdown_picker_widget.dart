// import 'package:flutter/material.dart';
// /*
// DropdownPickerWidget(
//                 menuOptions: list of dropdown options in key value pairs,                
//                 selectedOption: menu option string value,
//                 icon: IconData
//                 onChanged: (value) => print('changed'),
//               ),
// */

// class DropdownPickerWidget extends StatelessWidget {
//   const DropdownPickerWidget(
//       {this.menuOptions, this.selectedOption, this.onChanged, this.icon});

//   final List<dynamic> menuOptions;
//   final IconData icon;
//   final String selectedOption;
//   final void Function(String) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//         underline: const SizedBox(),
//         icon: Icon(icon ?? Icons.arrow_drop_down),
//         items: menuOptions
//             .map((dynamic data) => DropdownMenuItem<String>(
//                   value: data.key as String,
//                   child: Row(
//                     children: <Widget>[
//                       //  Text(data.emoji),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         data.value as String,
//                       ),
//                     ],
//                   ),
//                 ))
//             .toList(),
//         value: selectedOption,
//         onChanged: onChanged);
//   }
// }
