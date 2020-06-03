import 'package:expandable/expandable_constants.dart';
import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final bool expand;
  final Widget child;
  final Widget prefix;
  final Widget suffix;
  final Color suffixIconColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry headerPadding;
  final Decoration decoration;
  final String title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleStyle;

  ExpandableWidget({
    Key key,
    @required this.title,
    @required this.child,
    this.prefix,
    this.suffix,
    this.expand = false,
    this.suffixIconColor = Colors.black54,
    this.margin,
    this.padding,
    this.headerPadding,
    this.decoration,
    this.titlePadding,
    this.titleStyle,
  }) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with TickerProviderStateMixin {
  AnimationController _expandAnimationController;
  AnimationController _rotateAnimationController;

  Animation<double> _expandAnimation;
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _expandAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotateAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _expandAnimation = CurvedAnimation(
      parent: _expandAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _rotateAnimation =
        Tween(begin: 0.0, end: 0.5).animate(_rotateAnimationController);
  }

  @override
  void dispose() {
    _expandAnimationController?.dispose();
    _rotateAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(ExpandableKey.rootKey),
      margin: widget.margin ?? const EdgeInsets.all(10),
      padding: widget.padding ?? const EdgeInsets.all(10),
      decoration: widget.decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            key: const ValueKey(ExpandableKey.headerKey),
            onTap: () {
              if (_expandAnimationController.isAnimating) {
                return;
              }

              if (_expandAnimationController?.isCompleted ?? false) {
                _expandAnimationController.reverse();
                _rotateAnimationController.reverse();
              } else {
                _expandAnimationController.forward();
                _rotateAnimationController.forward();
              }
            },
            child: Container(
              padding: widget.headerPadding ?? const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  widget.prefix ?? Container(),
                  Expanded(
                    child: Padding(
                      padding: widget.titlePadding ??
                          const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.title ?? '',
                        style: widget.titleStyle ??
                            Theme.of(context).textTheme.title,
                        key: const ValueKey(ExpandableKey.titleKey),
                      ),
                    ),
                  ),
                  RotationTransition(
                    key: const ValueKey(ExpandableKey.arrowKey),
                    turns: _rotateAnimation,
                    child: widget.suffix ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: widget.suffixIconColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            key: const ValueKey(ExpandableKey.childKey),
            axisAlignment: 1.0,
            sizeFactor: _expandAnimation,
            child: widget.child ?? Container(),
          ),
        ],
      ),
    );
  }
}
