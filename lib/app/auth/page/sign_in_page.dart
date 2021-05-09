import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'phone_register_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // BackgroundVideo(),
            const SizedBox.expand(
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
      children: <Widget>[
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
          //  Container(),
          // Container(
          //   padding: EdgeInsets.all(16),
          //   width: 300,
          //   height: 200,
          //   color: Colors.grey.withAlpha(200),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: <Widget>[
          //       TextField(
          //         decoration: InputDecoration(
          //           hintText: 'Username',
          //         ),
          //       ),
          //       TextField(
          //         decoration: InputDecoration(
          //           hintText: 'Password',
          //         ),
          //       ),
          //       RaisedButton(
          //         child: Text('Login'),
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 24),
          SizedBox(
            height: 80,
            child: Image(
              image: AssetImage("asset/image/logo.png"),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Foody",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 24),
                Text(
                  "Enjoy deliveries from a varients restaurants.",
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

          SizedBox(height: 88),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                child: RaisedButton(
                  onPressed: () {},
                  shape: StadiumBorder(),
                  color: Colors.grey[50],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //    Icon(MaterialCommunityIcons.apple),
                          Text("With Apple"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 140,
                child: RaisedButton(
                  onPressed: () {},
                  shape: StadiumBorder(),
                  color: Color(0xFF4285F4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Icon(MaterialCommunityIcons.google,
                          //     color: Colors.white),
                          Text(
                            "With Google",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 24),
          Container(
            width: 300,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneRegisterPage()));
              },
              shape: StadiumBorder(),
              color: Colors.amber[700],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //  Icon(MaterialCommunityIcons.cellphone_message,
                      //       color: Colors.white),
                      Text(
                        "Countinue with phone",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
