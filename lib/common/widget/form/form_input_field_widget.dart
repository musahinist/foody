// import 'package:flutter/material.dart';

// /*
// FormInputField(
//                 controller: _url,
//                 labelText: 'Post URL',
//                 validator: Validator.notEmpty,
//                 keyboardType: TextInputType.multiline,
//                 minLines: 3,
//                 onChanged: (value) => print('changed'),
//                 onSaved: (value) => print('implement me'),
//               ),
// */

// class FormInputFieldWidget extends StatelessWidget {
//   const FormInputFieldWidget(
//       {this.controller,
//       this.labelText,
//       this.validator,
//       this.keyboardType = TextInputType.text,
//       this.obscureText = false,
//       this.minLines = 1,
//       this.onChanged,
//       this.onSaved});

//   final TextEditingController controller;
//   final String labelText;
//   final String Function(String) validator;
//   final TextInputType keyboardType;
//   final bool obscureText;
//   final int minLines;
//   final void Function(String) onChanged;
//   final void Function(String) onSaved;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         )),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black45, width: 1.1),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//               color: /*Palette.focusedinputBorderColor*/ Colors.black45,
//               width: 1.1),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         filled: true,
//         fillColor: Colors.black45, //Palette.inputFillColor,
//         labelText: labelText,
//       ),
//       controller: controller,
//       onSaved: onSaved,
//       onChanged: onChanged,
//       keyboardType: keyboardType,
//       autocorrect: false,
//       enableSuggestions: false,
//       obscureText: obscureText,
//       maxLines: null,
//       minLines: minLines,
//       validator: validator,
//     );
//   }
// }
