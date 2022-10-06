import 'package:animated_website/common/text_styles.dart';
import 'package:animated_website/interace/directions.dart';
import 'package:animated_website/interace/i_page_controller.dart';
import 'package:animated_website/model/app_config.dart';
import 'package:animated_website/widgets/molecule/move_animation.dart';
import 'package:flutter/material.dart';

class SlideTemplate extends StatelessWidget implements IPageController {
  final Widget child;
  final Function next;
  final Function prev;

  const SlideTemplate(
      {Key? key, required this.child, required this.next, required this.prev})
      : super(key: key);

  static const Color borderColor = Color(0xfff6e8b1);

  @override
  Widget build(BuildContext context) {
    double firstBlockWidth = MediaQuery.of(context).size.width * 0.1;
    double firstBlockHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: firstBlockHeight,
            width: double.infinity,
            color: borderColor,
            // child: MoveAnimation(
            //   icon: Icons.keyboard_arrow_up_sharp,
            //   direction: Directions.up,
            //   pageController: this,
            //   lengthOfAxis: firstBlockWidth / 2,
            // ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: firstBlockWidth,
                  color: borderColor,
                  child: MoveAnimation(
                    icon: Icons.keyboard_arrow_left_sharp,
                    direction: Directions.left,
                    pageController: this,
                    lengthOfAxis: firstBlockWidth / 2,
                  ),
                ),
                Expanded(child: child),
                Container(
                  height: double.infinity,
                  width: firstBlockWidth,
                  color: borderColor,
                  child: MoveAnimation(
                    icon: Icons.keyboard_arrow_right_sharp,
                    direction: Directions.right,
                    pageController: this,
                    lengthOfAxis: firstBlockWidth / 2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: firstBlockHeight,
            width: double.infinity,
            color: borderColor,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(-0.9, 0),
                  child: Text(AppConfig.instance.date,
                      style: CommonTextStyles.normal.copyWith(
                          color: Color.fromRGBO(79, 31, 33, 1), fontSize: 32)),
                ),
                // Center(
                //   child: MoveAnimation(
                //     icon: Icons.keyboard_arrow_down_sharp,
                //     direction: Directions.bottom,
                //     pageController: this,
                //     lengthOfAxis: firstBlockWidth / 2,
                //   ),
                // ),
                Align(
                  alignment: Alignment(0.9, 0),
                  child: Text('@viveky259259',
                      style: CommonTextStyles.normal.copyWith(
                          color: Color.fromRGBO(79, 31, 33, 1), fontSize: 32)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void clicked(Directions direction) {
    switch (direction) {
      case Directions.left:
        prev();
        break;
      case Directions.right:
        next();
        break;
      case Directions.up:
        prev();
        break;
      case Directions.bottom:
        next();
        break;
    }
  }
}
