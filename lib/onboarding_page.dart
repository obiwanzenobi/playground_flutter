import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_playground/onboarding/onboarding_background.dart';
import 'package:flutter_playground/widgets/animated_card_switcher.dart';
import 'package:flutter_playground/widgets/animated_fab.dart';

import 'onboarding/login_card.dart';
import 'onboarding/signup_card.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin {
//  AnimationController animationControllerMenu;
//  Animation<double> rotationAnim;
//  Animation<double> rotationBackAnim;
//  Animation<double> moveAnimation;
//  Animation<double> moveBackAnimation;
  bool _loginFirst = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

//    animationControllerMenu = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 1000),
//    )..addListener(() {
//        setState(() {
//          _loginFirst = animationControllerMenu.value < 0.5;
//        });
//      });
//    rotationAnim = Tween(begin: 0.0, end: -pi / 2.0).animate(
//      new CurvedAnimation(
//        parent: animationControllerMenu,
//        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
//      ),
//    );
//    rotationBackAnim = Tween(begin: -pi / 2.0, end: 0.0).animate(
//      new CurvedAnimation(
//        parent: animationControllerMenu,
//        curve: Interval(0.5, 1, curve: Curves.easeInBack),
//      ),
//    );
//    moveAnimation = Tween(begin: 0.0, end: 10.0).animate(
//      new CurvedAnimation(
//        parent: animationControllerMenu,
//        curve: Interval(0.0, 0.5),
//      ),
//    );
//    moveBackAnimation = Tween(begin: 10.0, end: 0.0).animate(
//      new CurvedAnimation(
//        parent: animationControllerMenu,
//        curve: Interval(0.5, 1),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
//    double angle = rotationAnim.value;
//    double angleBack = rotationBackAnim.value;
//    double move = moveAnimation.value;
//    double moveBack = moveBackAnimation.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          OnboardingBackground(),
          Stack(
            children: [
//              if (_loginFirst) _buildSignup() else _buildLogin(moveBack, angleBack),
//              if (_loginFirst) _buildLogin(move, angle) else _buildSignup(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AnimatedCardSwitcher(
                    firstChild: LoginCard(),
                    secondChild: SignupCard(),
                    state: _loginFirst ? CardSwitcherState.showFirst : CardSwitcherState.showSecond,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  child: Text("change"),
                  onPressed: () {
                    setState(() {
                      _loginFirst = !_loginFirst;
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

//  void _triggerAnimation() {
//    debugPrint("${animationControllerMenu.isDismissed}");
//    if (animationControllerMenu.isCompleted || animationControllerMenu.isAnimating) {
//      animationControllerMenu.reverse();
//    } else {
//      animationControllerMenu.forward();
//    }
//  }

  Center _buildSignup() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: 48,
        ),
        child: SignupCard(),
      ),
    );
  }

  Center _buildLogin(double move, double angle) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 32, right: 32.0),
        child: Transform.translate(
          offset: Offset(move, 0),
          child: Transform.rotate(
            angle: angle,
            alignment: Alignment.topRight,
            child: LoginCard(),
          ),
        ),
      ),
    );
  }
}
