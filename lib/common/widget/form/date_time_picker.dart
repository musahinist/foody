// import 'package:flutter/material.dart';

// class DateTimePicker extends StatefulWidget {
//   @override
//   _DateTimePickerState createState() => _DateTimePickerState();
// }

// class _DateTimePickerState extends State<DateTimePicker> {
//   DateTime _date;
//   TimeOfDay _time;
//   @override
//   void initState() {
//     super.initState();
//     _date = DateTime.now();
//     _time = TimeOfDay.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           ListTile(
//             title: Text("Date: ${_date.year}, ${_date.month}, ${_date.day}"),
//             trailing: Icon(Icons.keyboard_arrow_down),
//             onTap: _pickDate,
//           ),
//           ListTile(
//             title: Text("Time: ${_time.hour}:${_time.minute}"),
//             trailing: Icon(Icons.keyboard_arrow_down),
//             onTap: _pickTime,
//           ),
//         ],
//       ),
//     );
//   }

//   //using firstDate and lastDate parameter, we are allowing users to pick a date 5 years in past and 5 years in future.
//   _pickDate() async {
//     DateTime pickedDate = await showDatePicker(
//       context: context,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//       initialDate: _date,
//     );
//     if (pickedDate != null)
//       setState(() {
//         _date = pickedDate;
//       });
//   }

//   _pickTime() async {
//     TimeOfDay pickedTime =
//         await showTimePicker(context: context, initialTime: _time);
//     if (pickedTime != null)
//       setState(() {
//         _time = pickedTime;
//       });
//   }
// }
