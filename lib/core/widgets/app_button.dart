import 'package:flutter/material.dart';
import '../theme/pal.dart';

class AppButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final Color? color;

  const AppButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.filled = false,
    this.color,
  });

  @override
  State<AppButton> createState() => _BtnState();
}

class _BtnState extends State<AppButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final filled = widget.filled;
    final fg = filled ? Colors.white : p.text2;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _hover ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: filled && widget.color == null ? p.gradient : null,
            color: filled
                ? widget.color
                : (_hover
                      ? p.accent.withValues(alpha: 0.08)
                      : Colors.transparent),
            border: filled ? null : Border.all(color: p.border),
            boxShadow: filled && _hover
                ? [
                    BoxShadow(
                      color: (widget.color ?? p.accent).withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: fg),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: fg,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
