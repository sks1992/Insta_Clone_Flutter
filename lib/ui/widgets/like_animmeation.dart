import 'package:flutter/material.dart';

class LikeAnimation extends StatelessWidget {
  const LikeAnimation(
      {Key? key,
      required this.child,
      required this.isAnimating,
      this.duration = const Duration(milliseconds: 150),
      this.smallLike = false,
      this.onEnd})
      : super(key: key);

  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final bool smallLike;
  final VoidCallback? onEnd;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
