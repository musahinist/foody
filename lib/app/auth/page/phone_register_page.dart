import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/route_manager.dart';

import '../../home/page/home_page.dart';
import 'sms_code_input_page.dart';

class PhoneRegisterPage extends StatefulWidget {
  @override
  _PhoneRegisterPageState createState() => _PhoneRegisterPageState();
}

class _PhoneRegisterPageState extends State<PhoneRegisterPage> {
  final TextEditingController ctrl = TextEditingController(text: '+90');
  bool isButtonActive = false;
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
                children: [
                  const Text(
                    'Enter Your Mobil Number',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'We will send you a sms one time code.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
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
                            style: const TextStyle(fontSize: 36),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [PhoneInputFormatter()],
                            onChanged: (value) {
                              // if (value.length == 16)
                              setState(() {
                                if (value.length == 16) {
                                  isButtonActive = true;
                                } else {
                                  isButtonActive = false;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: RaisedButton(
                      onPressed: isButtonActive
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SmsCodeInputPage()));
                            }
                          : null,
                      shape: const StadiumBorder(),
                      color: Colors.amber[700],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            // Icon(MaterialCommunityIcons.cellphone_message,
                            //     color: Colors.white),
                            Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
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
