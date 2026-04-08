import 'package:flutter/material.dart';

import '../core/app_breakpoints.dart';
import '../core/app_i18n.dart';
import '../core/app_tokens.dart';
import 'content_container.dart';

class AppHero extends StatelessWidget {
  final String title;
  final String sub;

  const AppHero({super.key, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width < 900;
    final i18n = context.i18n;
    final stats = _heroStats(i18n);

    final heroText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: narrow ? 34 : 52,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            sub,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: narrow ? 16 : 20,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: AppSpace.lg),
        Wrap(
          spacing: AppSpace.md,
          runSpacing: AppSpace.sm,
          children: [
            FilledButton(
              onPressed: () {},
              child: Text(i18n.pick(
                uzLatin: "Ilovamizni yuklab oling",
                uzCyrillic: 'Иловамизни юклаб олинг',
                russian: 'Скачать приложение',
                english: 'Download app',
              )),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(i18n.pick(
                uzLatin: "Hozir murojaat qiling",
                uzCyrillic: 'Ҳозир мурожаат қилинг',
                russian: 'Свяжитесь сейчас',
                english: 'Contact now',
              )),
            ),
          ],
        ),
      ],
    );

    final statsBlock = Wrap(
      spacing: AppSpace.sm,
      runSpacing: AppSpace.sm,
      children: stats.map((stat) => _HeroStatCard(data: stat)).toList(),
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTokens.primaryDark, AppTokens.primary],
        ),
      ),
      child: ContentContainer(
        padding: EdgeInsets.fromLTRB(AppSpace.xl, narrow ? 48 : 64, AppSpace.xl, narrow ? 48 : 64),
        child: narrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heroText,
                  const SizedBox(height: AppSpace.lg),
                  statsBlock,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: heroText),
                  const SizedBox(width: AppSpace.xl),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hisobotlar',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppSpace.md),
                        statsBlock,
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  List<_HeroStatData> _heroStats(AppI18n i18n) => [
        _HeroStatData(
          value: '230+',
          label: i18n.pick(
            uzLatin: "A'zo NNT",
            uzCyrillic: "А'зо ННТ",
            russian: 'Членских ННО',
            english: 'Member NGOs',
          ),
        ),
        _HeroStatData(
          value: '150',
          label: i18n.pick(
            uzLatin: 'Tashkil qilingan tadbir',
            uzCyrillic: 'Ташкил қилинган тадбир',
            russian: 'Проведено событий',
            english: 'Events hosted',
          ),
        ),
        _HeroStatData(
          value: '12',
          label: i18n.pick(
            uzLatin: 'Hududiy hamkorlar',
            uzCyrillic: 'Ҳудудий ҳамкорлар',
            russian: 'Региональных партнёров',
            english: 'Regional partners',
          ),
        ),
      ];
}

class _HeroStatData {
  final String value;
  final String label;
  const _HeroStatData({required this.value, required this.label});
}

class _HeroStatCard extends StatelessWidget {
  final _HeroStatData data;
  const _HeroStatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTokens.accentSoft),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppTokens.text),
          ),
          const SizedBox(height: 6),
          Text(data.label, style: const TextStyle(color: AppTokens.textMuted, fontSize: 12)),
        ],
      ),
    );
  }
}
