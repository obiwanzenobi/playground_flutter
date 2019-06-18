import 'package:flutter/material.dart';

class AnimatedFab extends ImplicitlyAnimatedWidget {
  final Color foregroundColor;
  final Color backgroundColor;
  final Function onPressed;
  final Widget child;
  final String tooltip;

  AnimatedFab(
      {Key key,
      @required this.onPressed,
      this.foregroundColor = Colors.white,
      this.tooltip = '',
      @required this.backgroundColor,
      @required Duration duration,
      this.child,
      Curve curve = Curves.linear})
      : super(duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends AnimatedWidgetBaseState<AnimatedFab> {
  ColorTween _colorTween;

  @override
  void forEachTween(TweenVisitor visitor) {
    debugPrint("visitor: $visitor");
    _colorTween = visitor(_colorTween, widget.backgroundColor, evaluate);
  }

  ColorTween evaluate(dynamic value) {
    debugPrint("evauleate value $value");
    return ColorTween(begin: value);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      tooltip: widget.tooltip,
      backgroundColor: _colorTween.evaluate(animation),
      foregroundColor: widget.foregroundColor,
      child: widget.child,
    );
  }
}
