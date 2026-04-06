import 'package:flutter/material.dart';

import '../core/app_breakpoints.dart';
import '../core/app_tokens.dart';
import 'content_container.dart';

class AppHero extends StatelessWidget {
  final String title;
  final String sub;

  const AppHero({super.key, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    final bp = breakpointOf(MediaQuery.sizeOf(context).width);
    final fs = bp == AppBreakpoint.phone ? 28.0 : 34.0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF040C1A), Color(0xFF0A1B33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ContentContainer(
        padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xl, AppSpace.xl, AppSpace.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: fs, fontWeight: FontWeight.w700, height: 1.15)),
            const SizedBox(height: AppSpace.sm),
            Text(sub, style: const TextStyle(color: Color(0xFFB4DCFF), fontSize: 16, height: 1.45)),
          ],
        ),
      ),
    );
  }
}
