import 'package:flutter/material.dart';
import '../theme.dart';

/// A subtle gold shimmer that sweeps a hairline gradient across a child,
/// used on completed chapters to give them a "lit by gold" feel without
/// being distracting. Children are still interactive (Material is null).
class GoldShimmer extends StatefulWidget {
  final Widget child;
  final bool active;
  final Duration period;
  const GoldShimmer({
    super.key,
    required this.child,
    this.active = true,
    this.period = const Duration(seconds: 4),
  });

  @override
  State<GoldShimmer> createState() => _GoldShimmerState();
}

class _GoldShimmerState extends State<GoldShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.active) return widget.child;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (rect) {
            final t = _controller.value;
            return LinearGradient(
              begin: Alignment(-1.0 + 2 * t, 0),
              end: Alignment(0.0 + 2 * t, 0),
              colors: const [
                Color(0x00000000),
                CodexPalette.goldBright,
                Color(0x00000000),
              ],
              stops: const [0.4, 0.5, 0.6],
            ).createShader(rect);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
