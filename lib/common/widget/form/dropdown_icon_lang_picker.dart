// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';

// import '../../../config/const/app_options.dart';
// import '../../../util/pref_util.dart';
// import 'dropdown_picker_widget.dart';

// class LanguageIconDropDownPickerWidget extends StatelessWidget {
//   const LanguageIconDropDownPickerWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         DropdownPickerWidget(
//             icon: Icons.language,
//             menuOptions: LanguageOptions.languageOptions,
//             onChanged: (String value) async {
//               await PrefUtil.saveLanguage(value);
//               final Locale locale = Locale(value);
//               Get.updateLocale(locale);
//             }),
//       ],
//     );
//   }
// }
