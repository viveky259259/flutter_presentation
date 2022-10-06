import 'package:animated_website/common/text_styles.dart';
import 'package:animated_website/pages/speaker_intro.dart';
import 'package:animated_website/pages/thanks.dart';
import 'package:animated_website/widgets/template/slide_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with TickerProviderStateMixin {
  late AnimationController logoController;

  late Animation<double> logoTween;

  late Animation<Color?> colorAnimation;
  late AnimationController colorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logoController = AnimationController(
        duration: const Duration(milliseconds: 20000), vsync: this);

    logoTween = Tween<double>(begin: 0, end: 20000).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeIn),
    );

    colorController =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    colorAnimation =
        ColorTween(begin: Color.fromRGBO(255, 241, 222, 1), end: Colors.lime)
            .animate(colorController);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      logoController.forward();
      logoController.addListener(() {
        colorController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: colorAnimation,
      builder: (_, __) => Container(
        color: colorAnimation.value,
        child: SlideTemplate(
          next: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ThanksPage()));
          },
          prev: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SpeakerIntroPage()));
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: Text(
                  'Let\'s begin',
                  style: CommonTextStyles.normaBold.copyWith(
                    color: Color.fromRGBO(79, 31, 33, 1),
                    fontSize: 72,
                  ),
                ),
              ),
              Hero(
                tag: 'flutter_logo_center',
                child: Center(
                  child: AnimatedBuilder(
                    animation: logoTween,
                    builder: (_, __) => RotationTransition(
                      turns: AlwaysStoppedAnimation(logoTween.value / 360),
                      child: FlutterLogo(
                        size: 200 + logoTween.value,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
