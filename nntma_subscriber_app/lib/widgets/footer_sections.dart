import 'package:flutter/material.dart';

import '../core/app_tokens.dart';
import 'content_container.dart';

class DarkCta extends StatelessWidget {
  const DarkCta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTokens.navy,
      child: const ContentContainer(
        padding: EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xl, AppSpace.xl, AppSpace.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rasmiy murojaat, hamkorlik va malumot olish uchun biz bilan boglaning.',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700, height: 1.3),
            ),
            SizedBox(height: AppSpace.lg),
            _CtaButton(),
          ],
        ),
      ),
    );
  }
}

class _CtaButton extends StatelessWidget {
  const _CtaButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppTokens.primary,
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: const Text('Boglanish'),
    );
  }
}

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTokens.navy,
      child: const ContentContainer(
        padding: EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Color(0xFF175D75)),
            SizedBox(height: AppSpace.lg),
            Text('Tezkor havolalar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
            SizedBox(height: AppSpace.sm),
            Text('Biz haqimizda • Yangiliklar • Tadbirlar • Azo bolish', style: TextStyle(color: Color(0xFFB8CCD8))),
            SizedBox(height: AppSpace.lg),
            Text('Tel: (+998 55) 503-05-12', style: TextStyle(color: Color(0xFFB8CCD8))),
            Text('Email: info@ngo.uz', style: TextStyle(color: Color(0xFFB8CCD8))),
            SizedBox(height: AppSpace.lg),
            Text('© COPYRIGHT 2019-2026 OZNNTMA', style: TextStyle(color: Color(0xFFB8CCD8), fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
