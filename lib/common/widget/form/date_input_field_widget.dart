// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../config/style/app_color.dart';

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
//     return TextFormField(
//       focusNode: fieldFocusNode,
//       decoration: InputDecoration(
//         filled: true,
//         prefixIcon: Icon(iconPrefix),
//         labelText: labelText,
//       ),
//       controller: controller,
//       onSaved: onSaved,
//       autocorrect: false,
//       enableSuggestions: false,
//       textCapitalization: textCapitalization ?? TextCapitalization.none,
//       onChanged: onChanged,
//       textInputAction: TextInputAction.next,
//       keyboardType: keyboardType,
//       maxLength: maxLenght,
//       maxLines: maxLines,
//       minLines: minLines,
//       validator: validator,
//       readOnly: readOnly,
//       onTap: () async {
//         FocusScope.of(context).requestFocus(FocusNode());
//         showModalBottomSheet(
//           context: context,
//           backgroundColor: Colors.transparent,
//           builder: (BuildContext context) {
//             return Container(
//               margin: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: CalendarDatePicker(
//                 initialDate:
//                     DateTime.now().subtract(const Duration(days: 365 * 16 + 4)),
//                 firstDate: DateTime(1950),
//                 lastDate: DateTime.now().subtract(
//                   const Duration(days: 365 * 16 + 4),
//                 ),
//                 onDateChanged: (DateTime date) {
//                   final DateFormat f = DateFormat('yyyy-MM-dd');
//                   if (date != null) controller.text = f.format(date);
//                   date?.toIso8601String()?.substring(0, 10);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             );
//           },
//         );
//         // final DateTime date = await showDatePicker(
//         //   context: context,
//         //   initialDate:
//         //       DateTime.now().subtract(const Duration(days: 365 * 16 + 4)),
//         //   firstDate: DateTime(1950),
//         //   builder: (_, Widget child) {
//         //     return SingleChildScrollView(
//         //         child: Theme(
//         //       data: ThemeData.light().copyWith(
//         //           textTheme: const TextTheme(
//         //             bodyText1: TextStyle(fontSize: 10, color: Colors.black),
//         //             subtitle1: TextStyle(color: Colors.black),
//         //           ),
//         //           colorScheme: const ColorScheme.light(
//         //               primary: SaideColors.saideYellow)),
//         //       child: child,
//         //     ));
//         //   },
//         //   lastDate: DateTime.now().subtract(
//         //     const Duration(days: 365 * 16 + 4),
//         //   ),
//         // );
//         // final f = new DateFormat('dd-MM-yyyy');
//         //  final DateFormat f = DateFormat('yyyy-MM-dd');
//         //  if (date != null) controller.text = f.format(date);
//         //  date.?.toIso8601String()?.substring(0, 10);
//       },
//     );
//   }
// }
