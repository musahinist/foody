import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'sign_in_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = '/';
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController ctrl = PageController(initialPage: 0);
  final Duration _pageTransitionDuration = const Duration(milliseconds: 400);
  final Curve _pageCurve = Curves.easeIn;

  var isBuild = false;
  var currentIndex = 0;

  final List content = [
    {
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=700%2C636",
      "title": "All your favorite restaurant",
      "message":
          "Order From the Best Local \n Restaurant with easy \n on demand delivery "
    },
    {
      "image":
          "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/great_food_combos_for_losing_weight_slideshow/650x350_great_food_combos_for_losing_weight_slideshow.jpg",
      "title": "Unmatched \n relaibility",
      "message":
          "Experience peace of mind \n while tracking your order \n order in real time"
    },
    {
      "image":
          "https://www.verywellmind.com/thmb/V4XZp9b-EfiQHuB2o4vRcFrcSFo=/2000x1333/filters:fill(ABEAC3,1)/GettyImages-1036880806-62c38bf913194f6cb167502c71960fc3.jpg",
      "title": "24/7 support \n for you",
      "message":
          "Something come up? Talk \n to a real person. We \n are here to help."
    }
  ];
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AlignedText(),
              AnimatedCircleAvatar(
                  ctrl: ctrl,
                  isBuild: isBuild,
                  content: content,
                  currentIndex: currentIndex),
              Expanded(
                  child: PageView.builder(
                controller: ctrl,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  isBuild = true;
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          content[index]["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 24),
                        Text(
                          content[index]["message"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                },
              )),
              PageViewDotIndicator(
                  content: content, currentIndex: currentIndex),
              PrimaryElevatedButton(
                  currentIndex: currentIndex,
                  content: content,
                  ctrl: ctrl,
                  pageTransitionDuration: _pageTransitionDuration,
                  pageCurve: _pageCurve),
              // SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    Key? key,
    required this.currentIndex,
    required this.content,
    required this.ctrl,
    required Duration pageTransitionDuration,
    required Curve pageCurve,
  })   : _pageTransitionDuration = pageTransitionDuration,
        _pageCurve = pageCurve,
        super(key: key);

  final int currentIndex;
  final List content;
  final PageController ctrl;
  final Duration _pageTransitionDuration;
  final Curve _pageCurve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (currentIndex < content.length - 1) {
            ctrl.nextPage(duration: _pageTransitionDuration, curve: _pageCurve);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber[700]),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(currentIndex < content.length - 1 ? "Next" : "Start"),
          ),
        ),
      ),
    );
  }
}

class PageViewDotIndicator extends StatelessWidget {
  const PageViewDotIndicator({
    Key? key,
    required this.content,
    required this.currentIndex,
  }) : super(key: key);

  final List content;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          content.length,
          (index) {
            double size = currentIndex == index ? 9 : 6;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color:
                      currentIndex == index ? Colors.amber[700] : Colors.grey,
                  borderRadius: BorderRadius.circular(size / 2)),
              width: size,
              height: size,
            );
          },
        ),
      ),
    );
  }
}

class AnimatedCircleAvatar extends StatelessWidget {
  const AnimatedCircleAvatar({
    Key? key,
    required this.ctrl,
    required this.isBuild,
    required this.content,
    required this.currentIndex,
  }) : super(key: key);

  final PageController ctrl;
  final bool isBuild;
  final List content;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ctrl,
        builder: (context, widget) {
          return Transform.rotate(
            angle: isBuild ? math.pi * ctrl.page! * 2.0 : math.pi * 2.0,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(
                content[currentIndex]["image"],
              ),
            ),
          );
        });
  }
}

class AlignedText extends StatelessWidget {
  const AlignedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 48, bottom: 24, right: 24, left: 24),
        child: Text(
          "Skip",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
