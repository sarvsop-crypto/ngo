import 'package:flutter/material.dart';

import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetOrganizationPage extends StatelessWidget {
  const CabinetOrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleInfoPage(
      eyebrow: 'Tashkilot',
      title: 'NNT profil kartasi va huquqiy holat',
      section: 'Tashkilot malumotlari',
      rows: [
        ('Nomi', 'Yangi Nafas NNT'),
        ('STIR', '309001223'),
        ('Holat', 'Faol'),
        ('Keyingi yangilash', '2026-09-14'),
      ],
    );
  }
}

class CabinetReportsPage extends StatelessWidget {
  const CabinetReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: 'Hisobotlar',
      title: 'Yillik va choraklik hisobotlarni yuborish',
      children: [
        const CabinetSectionTitle('Hisobot topshirish'),
        const SizedBox(height: AppSpace.md),
        AdaptiveGrid(
          minCardWidth: 260,
          maxColumns: 3,
          children: const [
            _ActionCard('Yangi hisobot', 'Draft yaratish va bosqichma-bosqich toldirish'),
            _ActionCard('Qaytarilganlar', 'Izoh asosida tuzatib qayta yuborish'),
            _ActionCard('Arxiv', 'Oldingi topshirilgan hisobotlarni korish'),
          ],
        ),
      ],
    );
  }
}

class CabinetEventsPage extends StatelessWidget {
  const CabinetEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Yopiq tadbirlar',
      title: 'Azo NNTlar uchun maxsus tadbirlar',
      section: 'Tadbirlar taqvimi',
      items: [
        'Strategik rejalash seminari - 2026-04-20',
        'Grant yozish workshop - 2026-04-28',
        'Monitoring va baholash treningi - 2026-05-06',
      ],
    );
  }
}

class CabinetNotificationsPage extends StatelessWidget {
  const CabinetNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Bildirishnomalar',
      title: 'Segmentlangan xabarlar markazi',
      section: 'Songgi xabarlar',
      items: [
        'Yangi grant oynasi ochildi',
        'Hisobot topshirish muddati eslatmasi',
        'Profil malumotini tasdiqlash sorovi',
      ],
    );
  }
}

class CabinetApprovalsPage extends StatelessWidget {
  const CabinetApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Tasdiqlar',
      title: 'Rahbar tasdigini talab qiladigan amallar',
      section: 'Kutilayotgan tasdiqlar',
      items: [
        'Hisobot 2026-Q1 - imzo kutilmoqda',
        'Hujjat yangilash - rahbar tasdigi',
      ],
    );
  }
}

class CabinetStatisticsPage extends StatelessWidget {
  const CabinetStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: 'Statistika',
      title: 'Arizalar, hisobotlar va hujjatlar analitikasi',
      children: [
        const CabinetSectionTitle('Korsatkichlar'),
        const SizedBox(height: AppSpace.md),
        AdaptiveGrid(
          minCardWidth: 200,
          maxColumns: 4,
          children: const [
            _StatCard('Topshirilgan hisobotlar', '18'),
            _StatCard('Tasdiqlangan hujjatlar', '27'),
            _StatCard('Faol arizalar', '6'),
            _StatCard('Yangi xabarlar', '9'),
          ],
        ),
      ],
    );
  }
}

class CabinetSubscriptionPage extends StatelessWidget {
  const CabinetSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleInfoPage(
      eyebrow: 'Obuna',
      title: 'Azo holati va amal qilish muddati',
      section: 'Obuna holati',
      rows: [
        ('Tarif', 'NNT azo paketi'),
        ('Holat', 'Faol'),
        ('Tugash sanasi', '2026-12-31'),
      ],
    );
  }
}

class CabinetApiPage extends StatelessWidget {
  const CabinetApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleInfoPage(
      eyebrow: 'API',
      title: 'Mobil va integratsiya kalitlari',
      section: 'API sozlamalari',
      rows: [
        ('Client ID', 'ngo_mobile_client'),
        ('Token holati', 'Faol'),
        ('Oxirgi yangilash', '2026-04-02'),
      ],
    );
  }
}

class CabinetAuditPage extends StatelessWidget {
  const CabinetAuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Audit log',
      title: 'Muhim amallar tarixi',
      section: 'Oxirgi faoliyatlar',
      items: [
        '2026-04-05 14:40 - Hisobot yuborildi',
        '2026-04-05 11:18 - Profil yangilandi',
        '2026-04-04 17:03 - Hujjat yuklandi',
      ],
    );
  }
}

class CabinetEsignaturePage extends StatelessWidget {
  const CabinetEsignaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleInfoPage(
      eyebrow: 'E-imzo',
      title: 'ERI bilan hujjatlarni imzolash',
      section: 'ERI holati',
      rows: [
        ('Provider', 'ERI xizmat'),
        ('Ulangan', 'Ha'),
        ('Oxirgi imzo', '2026-03-30'),
      ],
    );
  }
}

class CabinetFeedbackPage extends StatelessWidget {
  const CabinetFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Fikr-mulohaza',
      title: 'Portal boyicha takliflar va baholar',
      section: 'Songgi fikrlar',
      items: [
        'Dashboard tez ishlayapti',
        'Hujjat yuklash oqimi qulayroq bolsin',
      ],
    );
  }
}

class CabinetKnowledgePage extends StatelessWidget {
  const CabinetKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Bilim bazasi',
      title: 'Qollanmalar va savol-javoblar',
      section: 'Mashhur mavzular',
      items: [
        'Hisobotni togri topshirish boyicha qollanma',
        'Grant arizasi uchun shablonlar',
        'Azo profilini yangilash tartibi',
      ],
    );
  }
}

class CabinetNntDataPage extends StatelessWidget {
  const CabinetNntDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleInfoPage(
      eyebrow: 'NNT malumotlari',
      title: 'Reyestrga boglangan tashkiliy korsatkichlar',
      section: 'Asosiy maydonlar',
      rows: [
        ('Reyestr ID', 'NNT-9981'),
        ('Hudud', 'Toshkent shahri'),
        ('Yonaltirish', 'Ijtimoiy himoya'),
      ],
    );
  }
}

class CabinetNewsPage extends StatelessWidget {
  const CabinetNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleListPage(
      eyebrow: 'Kabinet yangiliklari',
      title: 'Azo portaliga tegishli yangilanishlar',
      section: 'Portal yangiliklari',
      items: [
        'Yangi hisobot formasi ishga tushdi',
        'Imzo oqimi optimallashtirildi',
        'Murojaat markazida statuslar qoshildi',
      ],
    );
  }
}

class _SimpleInfoPage extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String section;
  final List<(String, String)> rows;

  const _SimpleInfoPage({
    required this.eyebrow,
    required this.title,
    required this.section,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: eyebrow,
      title: title,
      children: [
        CabinetSectionTitle(section),
        const SizedBox(height: AppSpace.md),
        CabinetCard(
          child: Column(
            children: [
              for (var i = 0; i < rows.length; i++) ...[
                _InfoRow(label: rows[i].$1, value: rows[i].$2),
                if (i != rows.length - 1) const Divider(height: AppSpace.lg),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SimpleListPage extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String section;
  final List<String> items;

  const _SimpleListPage({
    required this.eyebrow,
    required this.title,
    required this.section,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: eyebrow,
      title: title,
      children: [
        CabinetSectionTitle(section),
        const SizedBox(height: AppSpace.md),
        CabinetCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (var i = 0; i < items.length; i++) ...[
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.xs),
                  title: Text(items[i]),
                  trailing: const Icon(Icons.chevron_right),
                ),
                if (i != items.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(color: AppTokens.textMuted, fontWeight: FontWeight.w600))),
        Expanded(child: Text(value, textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.w700))),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ActionCard(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpace.sm),
          Text(subtitle, style: const TextStyle(color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.md),
          SizedBox(width: double.infinity, child: FilledButton(onPressed: () {}, child: const Text('Ochish'))),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.sm),
          Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppTokens.primaryDark)),
        ],
      ),
    );
  }
}
