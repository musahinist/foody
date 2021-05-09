import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:foody/app/home/page/home_page.dart';
import 'package:get/route_manager.dart';

import 'sms_code_input_page.dart';

class PhoneRegisterPage extends StatefulWidget {
  @override
  _PhoneRegisterPageState createState() => _PhoneRegisterPageState();
}

class _PhoneRegisterPageState extends State<PhoneRegisterPage> {
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
                    "Enter Your Mobil Number",
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
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      //    key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: ctrl,
                            // initialValue: "+90",
                            maxLength: 16,
                            style: TextStyle(fontSize: 36),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [PhoneInputFormatter()],
                            onChanged: (value) {
                              print(value);
                              // if (value.length == 16)
                              setState(() {
                                if (value.length == 16) {
                                  isButtonActive = true;
                                  print(isButtonActive);
                                } else {
                                  isButtonActive = false;
                                  print(isButtonActive);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
                                "Register",
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
