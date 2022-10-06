import 'package:animated_website/pages/content.dart';
import 'package:animated_website/widgets/template/slide_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 241, 222, 1),
      body: SlideTemplate(
        next: () {},
        prev: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ContentPage()));
        },
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'asset/images/thanks.png',
                fit: BoxFit.fitWidth,
              ),
              Lottie.asset('asset/lottie/confetti_alternative.json',
                  repeat: true),
            ],
          ),
        ),
      ),
    );
  }
}
