import 'package:flutter/material.dart';

class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double minCardWidth;
  final double spacing;
  final int maxColumns;

  const AdaptiveGrid({
    super.key,
    required this.children,
    this.minCardWidth = 260,
    this.spacing = 12,
    this.maxColumns = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final cols = (c.maxWidth / minCardWidth).floor().clamp(1, maxColumns);
        final itemWidth = (c.maxWidth - (cols - 1) * spacing) / cols;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final child in children) SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}
