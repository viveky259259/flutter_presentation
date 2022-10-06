import 'package:animated_website/model/app_config.dart';
import 'package:animated_website/pages/content.dart';
import 'package:animated_website/pages/speaker_intro.dart';
import 'package:animated_website/widgets/template/slide_template.dart';
import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double height = 100;
  double width = 100;
  bool forwardState = true;

  void updateContainer(bool forward) {
    if (forward) {
      height = 200;
      width = 250;
    } else {
      height = 100;
      width = 100;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTemplate(
        next: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ContentPage()));
        },
        prev: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SpeakerIntroPage()));
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  updateContainer(forwardState);
                  forwardState = !forwardState;
                },
                child: AnimatedContainer(
                  height: height,
                  width: width,
                  duration:
                      Duration(milliseconds: AppConfig.instance.animationTime),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
