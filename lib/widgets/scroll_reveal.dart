import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Wraps any widget so it fades + slides up **when it scrolls into view**,
/// like a portfolio site. Once revealed, it stays revealed — scrolling
/// away and back will not re-hide it.
///
/// To avoid edge cases where a card's `RenderBox` reports wrong geometry
/// (e.g. when nested inside a `Column` with the same scroll parent but
/// different paint origins), we use **two complementary checks**:
///
///   1. **Geometry check** — the widget's top edge is within
///      `[scrollOffset - 200, scrollOffset + viewportHeight + 200]`
///      (with a 200px lead margin so cards appear just before they
///      fully enter the viewport).
///   2. **Time fallback** — if 2.5 seconds pass and the card is still
///      not revealed, reveal it anyway. This guarantees no card stays
///      invisible if the geometry check is wrong.
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offsetY;
  final double startScale;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.offsetY = 22,
    this.startScale = 0.97,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  bool _triggered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    // Reveal on the first frame we have geometry for. Cards in the
    // initial viewport fade in immediately.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _checkVisibility();
    });
    // Re-check after the first 100ms once layout has had a chance to
    // settle. Some cards (especially those with constrained heights)
    // can report 0 size on the very first frame; this catches them.
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _checkVisibility();
    });
    // Safety net: if for any reason the geometry check never fires
    // (no scrollable, nested under a custom scroll, etc.), reveal
    // after a short delay so the card is never stuck invisible.
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) _reveal();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _reveal() {
    if (_triggered || !mounted) return;
    _triggered = true;
    _ctrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notif) {
        if (_triggered) return false;
        // Re-check on every scroll tick so the reveal feels continuous.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _checkVisibility();
        });
        return false;
      },
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          // Always render the child so it lays out and has a real
          // RenderBox — otherwise the visibility check has nothing to
          // measure. The opacity/scale is what hides it pre-reveal.
          final t = _ctrl.value;
          return Opacity(
            opacity: t,
            child: Transform.translate(
              offset: Offset(0, (1 - t) * widget.offsetY),
              child: Transform.scale(
                scale: widget.startScale + (1 - widget.startScale) * t,
                child: child,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }

  void _checkVisibility() {
    if (_triggered) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return;
    if (!renderObject.hasSize) return;

    // Find the enclosing scrollable. If we have none, we are not in a
    // scroll view at all — just show the content.
    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) {
      _reveal();
      return;
    }

    final position = scrollable.position;
    final scrollOffset = position.pixels;
    final viewportHeight = position.viewportDimension;

    // Get the widget's top edge in the scroll coordinate space using
    // the viewport ancestor. `getOffsetToReveal(renderObject, 0.0)`
    // returns the scroll offset at which the widget's TOP edge would
    // sit at the top of the viewport.
    final viewport = RenderAbstractViewport.of(renderObject);
    final reveal = viewport.getOffsetToReveal(renderObject, 0.0);
    final widgetTopInScrollSpace = reveal.offset;
    final widgetHeight = renderObject.size.height;
    final widgetBottomInScrollSpace = widgetTopInScrollSpace + widgetHeight;

    // Reveal when the widget is within the viewport (with a 200px lead
    // margin so cards appear just before they fully enter the viewport).
    const margin = 200.0;
    final viewportTop = scrollOffset - margin;
    final viewportBottom = scrollOffset + viewportHeight + margin;

    final isVisible = widgetTopInScrollSpace <= viewportBottom &&
        widgetBottomInScrollSpace >= viewportTop;

    if (isVisible) _reveal();
  }
}
