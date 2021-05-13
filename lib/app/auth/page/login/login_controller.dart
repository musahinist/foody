import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isObscure = true.obs;
  RxBool isLoggedIn = true.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void validate() => formKey.currentState!.validate();
  void toggleObscure() => isObscure.value = !isObscure.value;
  void toggleLoggedIn() => isLoggedIn.value = !isLoggedIn.value;
  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
