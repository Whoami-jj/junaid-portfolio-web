import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/pal.dart';
import 'reveal.dart';

class PageSection extends StatelessWidget {
  final String title, eyebrow;
  final Widget child;
  final bool tinted;

  const PageSection({
    super.key,
    required this.title,
    required this.eyebrow,
    required this.child,
    this.tinted = false,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final small = MediaQuery.sizeOf(context).width < 600;
    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: small ? 56 : 80,
        ),
        color: tinted ? p.surface.withValues(alpha: 0.5) : null,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                Reveal(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: small ? 30 : 40,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                      height: 1.1,
                      color: p.text,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Reveal(
                  delay: const Duration(milliseconds: 80),
                  child: Text(
                    eyebrow,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: p.text2),
                  ),
                ),
                const SizedBox(height: 16),
                Reveal(
                  delay: const Duration(milliseconds: 140),
                  child: Container(
                    width: 56,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: p.gradient,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Reveal(delay: const Duration(milliseconds: 200), child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildGrid(
  BoxConstraints c,
  List<Widget> items, {
  int cols = 2,
  double gap = 20,
}) {
  if (c.maxWidth < 760) cols = 1;
  final rows = <Widget>[];
  for (var i = 0; i < items.length; i += cols) {
    final slice = items.sublist(i, math.min(i + cols, items.length));
    rows.add(
      Padding(
        padding: EdgeInsets.only(bottom: gap),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < cols; j++) ...[
                if (j > 0) SizedBox(width: gap),
                Expanded(
                  child: j < slice.length
                      ? Reveal(
                          delay: Duration(milliseconds: 120 * j),
                          child: slice[j],
                        )
                      : const SizedBox(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
  return Column(children: rows);
}
