import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../home/page/home_page.dart';
import '../bloc/authentication_bloc.dart';
import 'onboarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.grey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthanticatedState) {
            Get.offAllNamed(HomePage.$PATH);
          } else if (state is UnAuthanticatedState) {
            Get.offAllNamed(OnboardingPage.$PATH);
          }
        },
        child: Stack(
          children: const [
            SizedBox.expand(
              child: Image(
                image: AssetImage('asset/image/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: CircularProgressIndicator.adaptive(),
            )
          ],
        ),
      ),
    );
  }
}
