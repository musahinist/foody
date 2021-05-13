// import 'package:flutter/material.dart';

// /*
// FormInputFieldWithIcon(
//                 controller: _email,
//                 iconPrefix: Icons.link,
//                 labelText: 'Post URL',
//                 validator: Validator.notEmpty,
//                 keyboardType: TextInputType.multiline,
//                 minLines: 3,
//                 onChanged: (value) => print('changed'),
//                 onSaved: (value) => print('implement me'),
//               ),
// */

// class DateInputFieldWidget extends StatelessWidget {
//   const DateInputFieldWidget({
//     this.controller,
//     this.iconPrefix,
//     this.labelText,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.minLines = 1,
//     this.maxLines,
//     this.onChanged,
//     this.onSaved,
//     // this.onTap,
//     this.readOnly = false,
//     this.textCapitalization,
//     this.next,
//     this.fieldFocusNode,
//     this.maxLenght,
//   });

//   final TextEditingController controller;
//   final IconData iconPrefix;
//   final String labelText;
//   final String Function(String) validator;
//   final TextCapitalization textCapitalization;
//   final TextInputType keyboardType;
//   final TextInputAction next;
//   final bool obscureText;
//   final bool readOnly;
//   final int minLines;
//   final int maxLines;
//   final int maxLenght;
//   final void Function(String) onChanged;
//   final void Function(String) onSaved;
// //  final void Function() onTap;
//   final FocusNode fieldFocusNode;

//   @override
//   Widget build(BuildContext context) {
//     return CalendarDatePicker(
//       initialDate: DateTime.now().subtract(const Duration(days: 365 * 16 + 4)),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now().subtract(
//         const Duration(days: 365 * 16 + 4),
//       ),
//       onDateChanged: (value) {
//         print(value);
//       },
//     );
//   }
// }
