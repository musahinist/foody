import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:foody/app/home/page/home_page.dart';
import 'package:get/route_manager.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class SmsCodeInputPage extends StatefulWidget {
  @override
  _SmsCodeInputPageState createState() => _SmsCodeInputPageState();
}

class _SmsCodeInputPageState extends State<SmsCodeInputPage> {
  final TextEditingController ctrl = TextEditingController();
  var isButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enter Code Send To Your Number",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "We will send you a sms one time code.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Padding(
                  //     padding: const EdgeInsets.all(30.0),
                  //     child: SmsAutoFillWidget()),
                  Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: isButtonActive
                          ? () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             SmsCodeInputPage()));
                              Get.offAllNamed(HomePage.$PATH);
                            }
                          : null,
                      shape: StadiumBorder(),
                      color: Colors.amber[700],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 36),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Icon(MaterialCommunityIcons.cellphone_message,
                              //     color: Colors.white),
                              Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class SmsAutoFillWidget extends StatefulWidget {
//   final Function onPressed;
//   SmsAutoFillWidget({
//     Key key,
//     this.onPressed,
//   }) : super(key: key);
//   @override
//   _SmsAutoFillWidgetState createState() => _SmsAutoFillWidgetState();
// }

// class _SmsAutoFillWidgetState extends State<SmsAutoFillWidget> {
//   String appSignature;
//   String otpCode;
//   final TextEditingController _sidController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();

//     SmsAutoFill().getAppSignature.then((signature) {
//       setState(() {
//         appSignature = signature;
//       });
//       SmsAutoFill().listenForCode;
//     });
//   }

//   @override
//   void dispose() {
//     SmsAutoFill().unregisterListener();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(appSignature);

//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           PinFieldAutoFill(
//             decoration: UnderlineDecoration(
//               textStyle: TextStyle(fontSize: 20, color: Colors.black),
//               colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
//             ),
//             currentCode: otpCode,
//             onCodeSubmitted: (code) {},
//             onCodeChanged: (code) {
//               if (code.length == 6) {
//                 FocusScope.of(context).requestFocus(FocusNode());
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
