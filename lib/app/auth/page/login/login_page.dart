import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../common/layout/auth_layout.dart';
import '../../../../common/widget/button/primary_button_widget.dart';
import '../../../../common/widget/card/form_card_widget.dart';
import '../../../../common/widget/form/form_input_field_with_icon_widget.dart';
import '../../../../util/validator_util.dart';
import '../../bloc/authentication_bloc.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = '/login';
  // final LoginController _c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoginController _c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FormCard(
          children: <Widget>[
            //  const LanguageIconDropDownPickerWidget(),
            Form(
              key: _c.formKey,
              child: Column(
                children: <Widget>[
                  FormInputFieldWithIconWidget(
                    controller: _c.emailController,
                    iconPrefix: Icons.email,
                    labelText: 'Email',
                    validator: ValidatorUtil().requiredField,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      _c.validate();
                    },
                  ),
                  Obx(
                    () => FormInputFieldWithIconWidget(
                      controller: _c.passwordController,
                      obscureText: _c.isObscure.value,
                      onPrefixTap: _c.toggleObscure,
                      iconPrefix: _c.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      labelText: 'Password',
                      validator: ValidatorUtil().requiredField,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        _c.validate();
                      },
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButtonWidget(
              color: Colors.amber,
              labelText: 'Sign In',
              onPressed: () {
                _c.validate();
                BlocProvider.of<AuthBloc>(context).add(EmailSignUpEvent(
                    email: _c.emailController.text,
                    password: _c.passwordController.text));
              },
            )
          ],
        ),
        // const SizedBox(height: 24),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
        //     LabelButtonWidget(
        //       labelText: "Reser Password",
        //       onPressed: () {},
        //     ),
        //     LabelButtonWidget(
        //       labelText: "SignUp",
        //       onPressed: () {},
        //     ),
        //   ],
        // )
      ],
    );
  }
}
