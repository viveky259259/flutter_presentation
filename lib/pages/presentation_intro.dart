import 'package:animated_website/common/text_styles.dart';
import 'package:animated_website/model/app_config.dart';
import 'package:animated_website/pages/speaker_intro.dart';
import 'package:animated_website/widgets/template/slide_template.dart';
import 'package:flutter/material.dart';

class PresentationIntroPage extends StatefulWidget {
  const PresentationIntroPage({Key? key}) : super(key: key);

  @override
  State<PresentationIntroPage> createState() => _PresentationIntroPageState();
}

class _PresentationIntroPageState extends State<PresentationIntroPage>
    with TickerProviderStateMixin {
  static const Color textColor = Color.fromRGBO(79, 31, 33, 1);

  late AnimationController titleController;

  late Animation<Offset> titleTween;

  late AnimationController logoController;

  late Animation<double> logoTween;

  late AnimationController communityController;

  late Animation<double> communityTween;
  int counter = 0;

  @override
  void initState() {
    titleController = AnimationController(
        duration: Duration(milliseconds: AppConfig.instance.animationTime),
        vsync: this);

    titleTween =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(30, 70))
            .animate(
                CurvedAnimation(parent: titleController, curve: Curves.easeIn));

    logoController = AnimationController(
        duration: Duration(milliseconds: AppConfig.instance.animationTime),
        vsync: this);

    logoTween = Tween<double>(begin: 100, end: 400).animate(
      CurvedAnimation(parent: logoController, curve: Curves.linear),
    );

    communityController = AnimationController(
        duration: Duration(milliseconds: AppConfig.instance.animationTime),
        vsync: this);

    communityTween = Tween<double>(begin: 30, end: 50).animate(
        CurvedAnimation(parent: titleController, curve: Curves.easeIn));

    super.initState(); //start animations
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      startLogoAnimation();
    });

    logoTween.addListener(() {
      if (logoTween.isCompleted) {
        titleController.forward();
      }
    });
    titleTween.addListener(() {
      if (titleTween.isCompleted) {
        communityController.forward();
      }
    });
  }

  startLogoAnimation() async {
    await logoController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 241, 222, 1),
        body: SlideTemplate(
          next: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SpeakerIntroPage()));
          },
          prev: () {},
          child: Stack(
            children: [
              AnimatedBuilder(
                  animation: titleTween,
                  builder: (context, child) {
                    return Positioned(
                      child: Opacity(
                          opacity: titleTween.value.dx == 0 ? 0 : 1,
                          child: Column(
                            children: [
                              Text(
                                AppConfig.instance.eventOrganiser,
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (titleTween.value.dx / 10)),
                              ),
                              Text(
                                AppConfig.instance.eventTitle,
                                style: CommonTextStyles.biggerBold.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (titleTween.value.dx / 10)),
                              ),
                            ],
                          )),
                      top: titleTween.value.dy,
                      left: titleTween.value.dy,
                    );
                  }),
              AnimatedBuilder(
                  animation: titleTween,
                  builder: (context, child) {
                    return Positioned(
                      bottom: communityTween.value,
                      left: titleTween.value.dy,
                      child: Opacity(
                          opacity: communityTween.value == 0 ? 0 : 1,
                          child: Column(
                            children: [
                              Text(
                                AppConfig.instance.venuePartner,
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 20)),
                              ),
                              Text(
                                AppConfig.instance.venueLocation,
                                style: CommonTextStyles.biggerBold.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 20)),
                              ),
                            ],
                          )),
                    );
                  }),
              AnimatedBuilder(
                animation: logoTween,
                builder: (context, child) {
                  return Positioned(
                    bottom: 40,
                    right: 40,
                    child: Hero(
                      tag: 'flutter_logo_center',
                      child: GestureDetector(
                          onTap: () {
                            titleController.forward();
                          },
                          child: FlutterLogo(
                            size: logoTween.value,
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
