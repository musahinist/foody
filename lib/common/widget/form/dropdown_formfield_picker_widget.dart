// import 'package:flutter/material.dart';

// /*
// DropdownFormfieldPicker(
//                 menuOptions: list of dropdown options in key value pairs,
//                 selectedOption: menu option string value,
//                 onChanged: (value) => print('changed'),
//               ),
// */
// class DropdownFormfieldPickerWidget extends StatelessWidget {
//   const DropdownFormfieldPickerWidget(
//       {this.labelText,
//       this.menuOptions,
//       this.selectedOption,
//       this.onChanged,
//       this.suffix = false});
//   final String labelText;
//   final List<dynamic> menuOptions;
//   final String selectedOption;
//   final void Function(String) onChanged;
//   final bool suffix;

//   @override
//   Widget build(BuildContext context) {
//     //if (Platform.isIOS) {}
//     return DropdownButtonFormField<String>(
//         hint: const Text('Identitiy'),
//         decoration: InputDecoration(
//             labelText: labelText,
//             border: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white))),
//         items: menuOptions
//             .map((dynamic data) => DropdownMenuItem<String>(
//                   value: data.key as String,
//                   child: Row(
//                     children: <Widget>[
//                       Icon(data.icon as IconData),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           data.value as String,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//             .toList(),
//         value: selectedOption,
//         isExpanded: true,
//         onChanged: onChanged);
//   }
// }
