import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  final Color borderColor;
  final double rotateAngle;

  const AnimatedBox(
      {super.key, required this.borderColor, required this.rotateAngle});

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      value: widget
          .rotateAngle, // Set the initial value to specify the starting angle
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
    );
  }
}
