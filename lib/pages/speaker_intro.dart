import 'package:animated_website/common/text_styles.dart';
import 'package:animated_website/model/app_config.dart';
import 'package:animated_website/pages/implicit_animations.dart';
import 'package:animated_website/pages/presentation_intro.dart';
import 'package:animated_website/widgets/template/slide_template.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpeakerIntroPage extends StatefulWidget {
  const SpeakerIntroPage({Key? key}) : super(key: key);

  @override
  State<SpeakerIntroPage> createState() => _SpeakerIntroPageState();
}

class _SpeakerIntroPageState extends State<SpeakerIntroPage>
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
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(40, 100))
            .animate(
                CurvedAnimation(parent: titleController, curve: Curves.easeIn));

    logoController = AnimationController(
        duration: Duration(milliseconds: AppConfig.instance.animationTime),
        vsync: this);

    logoTween = Tween<double>(begin: 30, end: 400).animate(
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
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ImplicitAnimations()));
          },
          prev: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => PresentationIntroPage()));
          },
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
                                'Vivek Yadav',
                                style: CommonTextStyles.biggerBold.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (titleTween.value.dx / 15)),
                              ),
                              Container(
                                width: titleTween.value.dx + 50,
                                color: Colors.grey.shade300,
                              ),
                              Text(
                                'Senior Mobile Dev @ZestMoney',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (titleTween.value.dx / 20)),
                              ),
                              Text(
                                'Google Developer Expert',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (titleTween.value.dx / 20)),
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
                                'Developer',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 20)),
                              ),
                              Text(
                                'Mentor',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 20)),
                              ),
                              Text(
                                'Creator',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 20)),
                              ),
                            ],
                          )),
                    );
                  }),
              AnimatedBuilder(
                  animation: titleTween,
                  builder: (context, child) {
                    return Positioned(
                      top: communityTween.value + 50,
                      right: communityTween.value,
                      child: Opacity(
                          opacity: communityTween.value == 0 ? 0 : 1,
                          child: Column(
                            children: [
                              Text(
                                '4+ Mobile Experience',
                                style: CommonTextStyles.normaBold.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 25)),
                              ),
                              Text(
                                'Flutter, Android, iOS',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 30)),
                              ),
                              Text(
                                'NodeJS, Firebase, Hasura',
                                style: CommonTextStyles.normal.copyWith(
                                    color: textColor,
                                    fontSize: 16 * (communityTween.value / 30)),
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
                          child: Container(
                            width: logoTween.value,
                            height: logoTween.value,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius:
                                //     BorderRadius.all(Radius.circular(150)),
                                image: DecorationImage(
                                    image:
                                        AssetImage('asset/images/badge.png'))),
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
