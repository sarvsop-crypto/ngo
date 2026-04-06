import 'package:flutter/material.dart';

import '../core/app_breakpoints.dart';
import '../core/app_tokens.dart';
import 'content_container.dart';

class ResponsiveSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final bool light;

  const ResponsiveSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.light = true,
  });

  @override
  Widget build(BuildContext context) {
    final bp = breakpointOf(MediaQuery.sizeOf(context).width);
    final hPad = bp == AppBreakpoint.phone ? AppSpace.lg : AppSpace.xl;

    return Container(
      color: light ? AppTokens.surface : AppTokens.bg,
      child: ContentContainer(
        padding: EdgeInsets.fromLTRB(hPad, AppSpace.lg, hPad, AppSpace.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: bp == AppBreakpoint.phone ? 20 : 24, fontWeight: FontWeight.w700)),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpace.sm),
              Text(subtitle!, style: const TextStyle(color: AppTokens.textMuted, fontSize: 14, height: 1.45)),
            ],
            const SizedBox(height: AppSpace.md),
            child,
          ],
        ),
      ),
    );
  }
}
