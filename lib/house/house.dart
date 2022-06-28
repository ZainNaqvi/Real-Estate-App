import 'package:flutter/material.dart';
import 'package:houses_olx/house/components/body.dart';
import 'components/appbar.dart';

class HouseScreen extends StatefulWidget {
  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation,
      degFourTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 2.10), weight: 15.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.10, end: 1.0), weight: 85.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(),
      body: Body(),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
              right: 30,
              bottom: 30,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  IgnorePointer(
                    child: Container(
                      color: Colors.white.withOpacity(
                          0.0), // comment or change to transparent color
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(270),
                        degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.red,
                        width: 40,
                        height: 40,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('First Button');
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(240),
                        degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black54,
                        width: 40,
                        height: 40,
                        icon: Icon(
                          Icons.shop_two,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('Second button');
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(210),
                        degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black54,
                        width: 40,
                        height: 40,
                        icon: Icon(
                          Icons.equalizer,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('Third Button');
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(180),
                        degFourTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degFourTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black54,
                        width: 40,
                        height: 40,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('Fourth Button');
                        },
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.red,
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onClick: () {
                        if (animationController.isCompleted) {
                          animationController.reverse();
                        } else {
                          animationController.forward();
                        }
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
