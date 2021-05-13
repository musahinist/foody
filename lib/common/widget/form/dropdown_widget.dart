// import 'package:flutter/material.dart';

// class DropDownFormFieldWidget extends StatelessWidget {
//   const DropDownFormFieldWidget({
//     this.labelText,
//     this.menuOptions,
//     this.selectedOption,
//     this.onChanged,
//     this.validator,
//   });
//   final String labelText;
//   final List<dynamic> menuOptions;
//   final String selectedOption;
//   final void Function(String) onChanged;
//   final String Function(String) validator;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16),
//       child: DropdownButtonFormField<String>(
//           validator: validator,
//           decoration: InputDecoration(
//             labelText: labelText,
//             contentPadding: const EdgeInsets.all(16),
//             fillColor: Colors.white,
//             filled: true,
//           ),
//           items: menuOptions
//               .map(
//                 (dynamic data) => DropdownMenuItem<String>(
//                   value: data as String,
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(child: Text(data as String)),
//                     ],
//                   ),
//                 ),
//               )
//               .toList(),
//           value: selectedOption,
//           isExpanded: true,
//           onChanged: onChanged),
//     );
//   }
// }
