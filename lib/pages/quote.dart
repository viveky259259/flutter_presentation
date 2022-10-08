import 'package:animated_website/pages/implicit_animations.dart';
import 'package:animated_website/pages/speaker_intro.dart';
import 'package:flutter/material.dart';

import '../widgets/template/slide_template.dart';

class QuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(157, 197, 220, 1),
      body: SlideTemplate(
        borderColor:const Color.fromRGBO(157, 197, 220, 1),
      
          next: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ImplicitAnimations()));
          },
          prev: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => SpeakerIntroPage()));
          },
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('asset/images/quote.png'))),
      ),
    ));
  }
}
