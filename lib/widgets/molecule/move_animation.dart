import 'package:animated_website/interace/directions.dart';
import 'package:animated_website/interace/i_page_controller.dart';
import 'package:flutter/material.dart';

class MoveAnimation extends StatefulWidget {
  final IconData icon;
  final Directions direction;
  final double lengthOfAxis;
  final IPageController pageController;

  const MoveAnimation(
      {Key? key,
      required this.icon,
      required this.direction,
      required this.pageController,
      this.lengthOfAxis = 50})
      : super(key: key);

  @override
  _MoveAnimationState createState() => _MoveAnimationState();
}

class _MoveAnimationState extends State<MoveAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 748));
    animation =
        Tween<double>(begin: 0, end: widget.lengthOfAxis).animate(controller);

    animation.addListener(() {
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await controller.forward();
        widget.pageController.clicked(widget.direction);
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          late Alignment alignment;
          switch (widget.direction) {
            case Directions.left:
              alignment =
                  Alignment(-5.0 * animation.value / widget.lengthOfAxis, 0);
              break;
            case Directions.right:
              alignment =
                  Alignment(5.0 * animation.value / widget.lengthOfAxis, 0);
              break;
            case Directions.up:
              alignment =
                  Alignment(0, -10.0 * animation.value / widget.lengthOfAxis);
              break;
            case Directions.bottom:
              alignment =
                  Alignment(0, 10.0 * animation.value / widget.lengthOfAxis);
              break;
          }

          print(alignment);
          return Align(
              alignment: alignment,
              child: Icon(
                widget.icon,
                size: animation.value > 0
                    ? animation.value + widget.lengthOfAxis / 2
                    : widget.lengthOfAxis / 2,
              ));
        },
      ),
    );
  }
}
