import 'package:flutter/material.dart';

import '../core/app_tokens.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ContentContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSpace.xl),
          child: child,
        ),
      ),
    );
  }
}
