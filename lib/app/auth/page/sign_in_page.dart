import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:video_player/video_player.dart';

import '../bloc/authentication_bloc.dart';
import 'login/login_page.dart';
import 'phone_register_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = 'signIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: const <Widget>[
            // BackgroundVideo(),
            SizedBox.expand(
              child: Image(
                image: AssetImage('asset/image/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            LoginWidget()
          ],
        ),
      ),
    );
  }
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://player.vimeo.com/external/376205878.sd.mp4?s=8023fe39936c7257e08c453ddacad385451a2093&profile_id=165&oauth2_token_id=57447761')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        // SizedBox.expand(
        //   child: FittedBox(
        //     fit: BoxFit.cover,
        //     child: SizedBox(
        //       width: _controller.value.size.width,
        //       height: _controller.value.size.height,
        //       child: VideoPlayer(_controller),
        //     ),
        //   ),
        // ),
        LoginWidget()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(
            height: 80,
            child: Image(
              image: AssetImage('asset/image/logo.png'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: Column(
              children: const <Widget>[
                Text(
                  'Welcome to Foody',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 24),
                Text(
                  'Enjoy deliveries from a varients restaurants.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 88),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneRegisterPage()));
                  },
                  title: const Text('With Apple'),
                  icon: const Icon(Icons.ac_unit),
                  color: Colors.grey[50],
                ),
                IconElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(const GoogleSignInEvent());
                  },
                  title: const Text('With Google'),
                  icon: const Icon(Icons.ac_unit),
                  color: const Color(0xFF4285F4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 300,
            child: IconElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginPage()));
                Get.toNamed(LoginPage.$PATH);
              },
              title: const Text('Countinue with Email'),
              icon: const Icon(Icons.ac_unit),
            ),
          ),
          SizedBox(
            width: 300,
            child: IconElevatedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneRegisterPage()));
              },
              title: const Text('Countinue with phone'),
              icon: const Icon(Icons.ac_unit),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class IconElevatedButton extends StatelessWidget {
  const IconElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.color = Colors.amber,
  }) : super(key: key);
  final Text title;
  final Color? color;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 8),
                title,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
