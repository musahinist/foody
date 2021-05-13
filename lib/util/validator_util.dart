class ValidatorUtil {
  ValidatorUtil();

  // String email(String value) {
  //   const Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   // r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  //   // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  //   final RegExp regex = RegExp(pattern as String);
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.email;
  //   } else {
  //     return null;
  //   }
  // }

  // String digits(String value) {
  //   const Pattern pattern = r'^\d{6,}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.password;
  //   } else {
  //     return null;
  //   }
  // }

  // String password(String value) {
  //   const Pattern pattern = r'^\d{6}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.password;
  //   } else {
  //     final List<String> digits = value.trim().split('');
  //     //  print(digits);
  //     final int differents = digits.toSet().length;
  //     int pconsecutives = 0;
  //     int nconsecutives = 0;
  //     for (int i = 0; i < digits.length - 1; i++) {
  //       if (int.tryParse(digits[i + 1]) == (int.tryParse(digits[i]) + 1)) {
  //         pconsecutives++;
  //       } else {
  //         pconsecutives = pconsecutives >= 3 ? pconsecutives : 0;
  //       }
  //       if (int.tryParse(digits[i + 1]) == (int.tryParse(digits[i]) - 1)) {
  //         nconsecutives++;
  //       } else {
  //         nconsecutives = nconsecutives >= 3 ? nconsecutives : 0;
  //       }
  //     }
  //     // print(differents.toString());
  //     // print(pconsecutives.toString());
  //     // print(nconsecutives.toString());
  //     if (differents <= 2 || pconsecutives >= 3 || nconsecutives >= 3) {
  //       return ' must be 6 digits including at least 3 different and 4 not consecutive numbers.';
  //     }
  //     return null;
  //   }
  // }

  // String sid(String value) {
  //   const Pattern pattern = r'^[A-Z0-9]{8}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (regex.hasMatch(value.trim())) {
  //     final String subValue = value.substring(2, 7);
  //     // print(subValue);
  //     final List<int> codeUnits = subValue.codeUnits;
  //     // print(codeUnits);
  //     final int sum =
  //         codeUnits.reduce((int value, int element) => value + element);
  //     //  print(sum);
  //     if (sum % 10 ==
  //         int.parse(
  //           value.substring(7, 8),
  //           onError: (String value) => 561978, //happy birthday
  //         )) {
  //       return null;
  //     } else {
  //       return labels.validator.sid;
  //     }
  //   } else {
  //     return labels.validator.sid;
  //   }
  // }

  // String name(String value) {
  //   const Pattern pattern = r'^[A-Z İĞÜŞÖÇ]+$'; //r"^[a-zA-ZğüşöçıİĞÜŞÖÇ]+$";
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.name;
  //   } else {
  //     return null;
  //   }
  // }

  // String lastName(String value) {
  //   const Pattern pattern = r'^[A-Z İĞÜŞÖÇ]+$'; // r"^[a-zA-ZğüşöçıİĞÜŞÖÇ]+$";
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.lastName;
  //   } else {
  //     return null;
  //   }
  // }

  // String nameComplation(String value, String matchedName) {
  //   const Pattern pattern = r'^[A-Z İĞÜŞÖÇ]+$'; //r"^[a-zA-ZğüşöçıİĞÜŞÖÇ]+$";
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.name;
  //   } else if (value.trim() != matchedName.trim().toUpperCase()) {
  //     return labels.validator.didntMatch;
  //   } else {
  //     return null;
  //   }
  // }

  // String number(String value) {
  //   const Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.number;
  //   } else {
  //     return null;
  //   }
  // }

  // String numeric(String value) {
  //   const Pattern pattern = r'^[0-9]';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.number;
  //   } else {
  //     return null;
  //   }
  // }

  // String tcknNumber(String value) {
  //   const Pattern pattern = r'^[1-8][0-9]{10}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.tckn;
  //   } else {
  //     return yknTcknNumberAlgoritm(regex, value);
  //   }
  // }

  // String yknNumber(String value) {
  //   const Pattern pattern = r'^[9-9][0-9]{10}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.ykn;
  //   } else {
  //     return yknTcknNumberAlgoritm(regex, value);
  //   }
  // }

  // String yknTcknNumberAlgoritm(RegExp regex, String value) {
  //   final List<String> numberList = value.split('');
  //   int totalFirst10 = 0;
  //   for (int i = 0; i < 10; i++) {
  //     totalFirst10 += int.tryParse(numberList[i]);
  //   }
  //   if ((totalFirst10 % 10).toString() == numberList[10]) {
  //     int totalY1 = 0;
  //     int totalY2 = 0;
  //     for (int i = 0; i < 9; i += 2) {
  //       totalY1 += int.tryParse(numberList[i]);
  //     }
  //     for (int i = 1; i < 9; i += 2) {
  //       totalY2 += int.tryParse(numberList[i]);
  //     }
  //     if (((totalY1 * 7 - totalY2) % 10).toString() == numberList[9]) {
  //       return null;
  //     }
  //     return labels.validator.tcknAndYkn;
  //   }
  //   return labels.validator.tcknAndYkn;
  // }

  // String phone(String value) {
  //   // const Pattern pattern = r'^(?:[+0]9)?[0-9]{7,12}$';
  //   const Pattern pattern = r'^[0-9]{7,12}$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.phone;
  //   } else {
  //     return null;
  //   }
  // }

  // String amount(String value) {
  //   const Pattern pattern = r'^\d+$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.amount;
  //   } else if (int.parse(value.trim()) <= 0) {
  //     return labels.validator.greaterThanZero;
  //   } else if (value.length >= 18) {
  //     return labels.validator.tooLongNumber;
  //   } else {
  //     return null;
  //   }
  // }

  // String notEmpty(String value) {
  //   const Pattern pattern = r'^\S+$';
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (!regex.hasMatch(value.trim())) {
  //     return labels.validator.notEmpty;
  //   } else {
  //     return null;
  //   }
  // }

  String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'labels.validator.notEmpty';
    } else {
      return null;
    }
  }
}
