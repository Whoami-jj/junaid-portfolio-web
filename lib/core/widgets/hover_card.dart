import 'package:flutter/material.dart';
import '../theme/pal.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final Color accent;
  final double padding;

  const HoverCard({
    super.key,
    required this.child,
    required this.accent,
    this.padding = 24,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        width: double.infinity,
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
          color: p.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hover ? widget.accent.withValues(alpha: 0.55) : p.border,
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: widget.accent.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}
