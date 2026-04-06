import 'package:flutter/material.dart';

import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetSettingsPage extends StatelessWidget {
  const CabinetSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: 'Sozlamalar',
      title: 'Profil va hisob sozlamalari',
      children: [
        AdaptiveGrid(
          minCardWidth: 240,
          maxColumns: 3,
          children: const [
            _SettingsNavItem(Icons.person_outline, 'Profil', true),
            _SettingsNavItem(Icons.apartment_outlined, 'Tashkilot', false),
            _SettingsNavItem(Icons.shield_outlined, 'Xavfsizlik', false),
          ],
        ),
        const SizedBox(height: AppSpace.lg),
        CabinetCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Shaxsiy malumotlar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: AppSpace.md),
              AdaptiveGrid(
                minCardWidth: 280,
                maxColumns: 2,
                children: const [
                  _LabeledInput('Ism', TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Kamolov Sanjar'))),
                  _LabeledInput('Email', TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'kamolov@yanginafas.uz'))),
                  _LabeledInput('Telefon', TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: '+998 90 123 45 67'))),
                  _LabeledInput('Lavozim', TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Tashkilot rahbari'))),
                ],
              ),
              const SizedBox(height: AppSpace.md),
              Row(
                children: [
                  FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.save_outlined), label: const Text('Saqlash')),
                  const SizedBox(width: AppSpace.sm),
                  OutlinedButton(onPressed: () {}, child: const Text('Bekor qilish')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool active;

  const _SettingsNavItem(this.icon, this.text, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFEAF2F7) : Colors.white,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: active ? AppTokens.primaryDark : AppTokens.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: active ? AppTokens.primaryDark : AppTokens.textMuted),
          const SizedBox(width: AppSpace.sm),
          Text(text, style: TextStyle(fontWeight: FontWeight.w700, color: active ? AppTokens.primaryDark : AppTokens.text)),
        ],
      ),
    );
  }
}

class _LabeledInput extends StatelessWidget {
  final String label;
  final Widget child;

  const _LabeledInput(this.label, this.child);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: AppSpace.xs),
        child,
      ],
    );
  }
}
