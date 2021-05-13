// import 'package:flutter/material.dart';
// import 'package:saide_b2b/view/widget/button/profile_picture_atom.dart';

// import '../../../config/style/app_color.dart';

// class CommentInputWidget extends StatelessWidget {
//   const CommentInputWidget({
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
//     this.onTap,
//     this.readOnly = false,
//     this.textCapitalization,
//     this.next,
//     this.fieldFocusNode,
//     this.maxLenght,
//     this.onPrefixTap,
//     this.onSuffixTap,
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
//   final void Function() onTap;
//   final void Function() onPrefixTap;
//   final void Function() onSuffixTap;
//   final FocusNode fieldFocusNode;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: TextFormField(
//         focusNode: fieldFocusNode,
//         decoration: InputDecoration(
//             //  filled: true,
//             //  fillColor: Colors.white,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide.none,
//               // borderRadius: BorderRadius.all(
//               //   Radius.circular(5.0),
//               // ),
//             ),
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 10,
//                 backgroundImage:
//                     NetworkImage('https://www.fillmurray.com/100/100'),
//               ),
//             ),
//             // prefixIcon: IconButton(
//             //   icon: Icon(iconPrefix),
//             //   onPressed: onPrefixTap,
//             // ),
//             suffixIcon: IconButton(
//               icon: const Icon(
//                 Icons.emoji_emotions_outlined,
//                 color: SaideColors.saideYellow,
//                 size: 32,
//               ),
//               onPressed: onSuffixTap,
//             ),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.never,
//             errorMaxLines: 2),
//         controller: controller,
//         onSaved: onSaved,
//         autocorrect: false,
//         enableSuggestions: false,
//         textCapitalization: textCapitalization ?? TextCapitalization.none,
//         onChanged: onChanged,
//         textInputAction: TextInputAction.next,
//         onTap: onTap,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         maxLength: maxLenght,
//         maxLines: maxLines ?? 1,
//         minLines: minLines,
//         validator: validator,
//         readOnly: readOnly,
//       ),
//     );
//   }
// }
