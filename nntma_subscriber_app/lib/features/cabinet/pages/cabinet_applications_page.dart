import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/app_i18n.dart';
import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetApplicationsPage extends StatefulWidget {
  const CabinetApplicationsPage({super.key});

  @override
  State<CabinetApplicationsPage> createState() => _CabinetApplicationsPageState();
}

class _CabinetApplicationsPageState extends State<CabinetApplicationsPage> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final titles = [
      l(uz: 'Umumiy', cy: 'Умумий', ru: 'Общее', en: 'Overview'),
      l(uz: 'Ariza', cy: 'Ариза', ru: 'Заявка', en: 'Application'),
      l(uz: 'Hujjatlar', cy: 'Ҳужжатлар', ru: 'Документы', en: 'Documents'),
    ];
    final subtitles = [
      l(uz: "A'zo arizasi jarayoni va hujjatlar holati.", cy: 'Аъзо аризаси жараёни ва ҳужжатлар ҳолати.', ru: 'Процесс членской заявки и статус документов.', en: 'Membership application process and document status.'),
      l(uz: 'Barcha arizalaringizning joriy holati va tarixi.', cy: 'Барча аризаларингизнинг жорий ҳолати ва тарихи.', ru: 'Текущий статус и история всех ваших заявок.', en: 'Current status and history of all your applications.'),
      l(uz: 'Talab qilinadigan hujjatlar, yuklash va tasdiq holati.', cy: 'Талаб қилинадиган ҳужжатлар, юклаш ва тасдиқ ҳолати.', ru: 'Необходимые документы, загрузка и статус подтверждения.', en: 'Required documents, upload and approval status.'),
    ];

    return CabinetPageScaffold(
      eyebrow: l(uz: 'Kabinet', cy: 'Кабинет', ru: 'Кабинет', en: 'Cabinet'),
      title: titles[_tab],
      subtitle: subtitles[_tab],
      children: [
        _KabinetTabs(active: _tab, onSelect: (i) => setState(() => _tab = i)),
        const SizedBox(height: AppSpace.xl),
        if (_tab == 0) ...[
          _HeaderActions(onSelectTab: (i) => setState(() => _tab = i)),
          const SizedBox(height: AppSpace.lg),
          _WarningBanner(),
          const SizedBox(height: AppSpace.xl),
          AdaptiveGrid(
            minCardWidth: 220,
            maxColumns: 4,
            children: [
              _StatusCard(
                l(uz: 'Ariza holati', cy: 'Ариза ҳолати', ru: 'Статус заявки', en: 'Application status'),
                l(uz: "Ko'rib chiqilmoqda", cy: 'Кўриб чиқилмоқда', ru: 'На рассмотрении', en: 'Under review'),
                'ARZ-2026-0418',
                const Color(0xFFB45309),
              ),
              _StatusCard(
                l(uz: 'Bosqich', cy: 'Босқич', ru: 'Этап', en: 'Stage'),
                '2 / 4',
                l(uz: 'Hujjatlar tekshiruvi', cy: 'Ҳужжатлар текшируви', ru: 'Проверка документов', en: 'Documents review'),
                AppTokens.primaryDark,
              ),
              _StatusCard(
                l(uz: 'Topshirilgan', cy: 'Топширилган', ru: 'Подано', en: 'Submitted'),
                '02.04.2026',
                l(uz: 'Sana', cy: 'Сана', ru: 'Дата', en: 'Date'),
                const Color(0xFF0F7B4B),
              ),
              _StatusCard(
                l(uz: "A'zolik", cy: 'Аъзолик', ru: 'Членство', en: 'Membership'),
                l(uz: 'Kutilmoqda', cy: 'Кутилмоқда', ru: 'Ожидается', en: 'Pending'),
                l(uz: 'Hali tasdiqlanmagan', cy: 'Ҳали тасдиқланмаган', ru: 'Ещё не подтверждено', en: 'Not yet confirmed'),
                AppTokens.textMuted,
              ),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          AdaptiveGrid(
            minCardWidth: 320,
            maxColumns: 2,
            children: [_StagesCard(), _DocumentStatusCard()],
          ),
          const SizedBox(height: AppSpace.xl),
          AdaptiveGrid(
            minCardWidth: 320,
            maxColumns: 2,
            children: [_RecentActionsCard(), _NewsCard()],
          ),
        ] else if (_tab == 1) ...[
          _AppFilterChips(),
          const SizedBox(height: AppSpace.xl),
          AdaptiveGrid(
            minCardWidth: 200,
            maxColumns: 4,
            children: [
              _MiniMetric(l(uz: 'Joriy holat', cy: 'Жорий ҳолат', ru: 'Текущий статус', en: 'Current status'), l(uz: "Ko'rib chiqilmoqda", cy: 'Кўриб чиқилмоқда', ru: 'На рассмотрении', en: 'Under review'), const Color(0xFFB45309)),
              _MiniMetric(l(uz: 'Bosqich', cy: 'Босқич', ru: 'Этап', en: 'Stage'), '2 / 4', AppTokens.primaryDark),
              _MiniMetric(l(uz: 'Hujjatlar', cy: 'Ҳужжатлар', ru: 'Документы', en: 'Documents'), '3 / 7', AppTokens.text),
              _MiniMetric(l(uz: 'Topshirilgan', cy: 'Топширилган', ru: 'Подано', en: 'Submitted'), '02.04.2026', AppTokens.text),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          _ApplicationStages(),
          const SizedBox(height: AppSpace.xl),
          _HistoryTable(),
        ] else ...[
          AdaptiveGrid(
            minCardWidth: 180,
            maxColumns: 4,
            children: [
              _KpiCard(l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждено', en: 'Approved'), '3', const Color(0xFF0F7B4B)),
              _KpiCard(l(uz: 'Muddatli', cy: 'Муддатли', ru: 'Просрочено', en: 'Overdue'), '1', const Color(0xFFB45309)),
              _KpiCard(l(uz: 'Kutilmoqda', cy: 'Кутилмоқда', ru: 'Ожидается', en: 'Pending'), '3', AppTokens.textMuted),
              _KpiCard(l(uz: 'Jami', cy: 'Жами', ru: 'Всего', en: 'Total'), '7', AppTokens.primaryDark),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          _ProgressCard(),
          const SizedBox(height: AppSpace.xl),
          CabinetSectionTitle(l(uz: 'Hujjatlar toplami', cy: 'Ҳужжатлар тўплами', ru: 'Комплект документов', en: 'Document set')),
          const SizedBox(height: AppSpace.lg),
          _DocumentsTable(),
          const SizedBox(height: AppSpace.xl),
          _UploadPanel(),
        ],
      ],
    );
  }
}

// ─── Tab switcher ────────────────────────────────────────────────────────────

class _KabinetTabs extends StatelessWidget {
  final int active;
  final ValueChanged<int> onSelect;
  const _KabinetTabs({required this.active, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final items = [
      (PhosphorIconsRegular.squaresFour, l(uz: 'Umumiy', cy: 'Умумий', ru: 'Общее', en: 'Overview')),
      (PhosphorIconsRegular.clipboardText, l(uz: 'Ariza', cy: 'Ариза', ru: 'Заявка', en: 'Application')),
      (PhosphorIconsRegular.folder, l(uz: 'Hujjatlar', cy: 'Ҳужжатлар', ru: 'Документы', en: 'Documents')),
    ];

    return Wrap(
      spacing: AppSpace.sm,
      children: [
        for (var i = 0; i < items.length; i++)
          _KabinetTab(
            icon: items[i].$1,
            label: items[i].$2,
            active: active == i,
            onTap: () => onSelect(i),
          ),
      ],
    );
  }
}

class _KabinetTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _KabinetTab({required this.icon, required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
        decoration: BoxDecoration(
          color: active ? AppTokens.primaryDark : Colors.white,
          border: Border.all(color: active ? AppTokens.primaryDark : AppTokens.border),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(icon, size: 15, color: active ? Colors.white : AppTokens.textMuted),
            const SizedBox(width: AppSpace.xs),
            Text(label, style: TextStyle(color: active ? Colors.white : AppTokens.text, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

// ─── Dashboard tab ────────────────────────────────────────────────────────────

class _HeaderActions extends StatelessWidget {
  final ValueChanged<int> onSelectTab;
  const _HeaderActions({required this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return Row(
      children: [
        Expanded(
          child: Text(
            l(uz: "A'zo arizasi jarayoni va hujjatlar holati", cy: 'Аъзо аризаси жараёни ва ҳужжатлар ҳолати', ru: 'Процесс членской заявки и статус документов', en: 'Membership application process and document status'),
            style: const TextStyle(fontSize: 15, color: AppTokens.textMuted),
          ),
        ),
        const SizedBox(width: AppSpace.md),
        OutlinedButton.icon(
          onPressed: () => onSelectTab(2),
          icon: const PhosphorIcon(PhosphorIconsRegular.folder),
          label: Text(l(uz: 'Hujjatlar', cy: 'Ҳужжатлар', ru: 'Документы', en: 'Documents')),
        ),
        const SizedBox(width: AppSpace.sm),
        FilledButton.icon(
          onPressed: () => onSelectTab(1),
          icon: const PhosphorIcon(PhosphorIconsRegular.clipboardText),
          label: Text(l(uz: 'Ariza holatim', cy: 'Ариза ҳолатим', ru: 'Мой статус заявки', en: 'My application status')),
        ),
      ],
    );
  }
}

class _WarningBanner extends StatelessWidget {
  const _WarningBanner();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.md),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7),
        border: Border.all(color: const Color(0xFFFDE68A)),
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
      ),
      child: Row(
        children: [
          const PhosphorIcon(PhosphorIconsRegular.warning, color: Color(0xFF92400E)),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Text(
              l(
                uz: 'Muddatli hujjat: Ustav yangi tahrir 10.04.2026 gacha taqdim etilishi kerak.',
                cy: 'Муддатли ҳужжат: Устав янги таҳрир 10.04.2026 гача тақдим этилиши керак.',
                ru: 'Просроченный документ: Устав (новая редакция) должен быть представлен до 10.04.2026.',
                en: 'Overdue document: Charter (new edition) must be submitted by 10.04.2026.',
              ),
              style: const TextStyle(color: Color(0xFF92400E), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final String note;
  final Color valueColor;
  const _StatusCard(this.label, this.value, this.note, this.valueColor);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.sm),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: valueColor, height: 1.1)),
          const SizedBox(height: AppSpace.xs),
          Text(note, style: const TextStyle(fontSize: 12, color: AppTokens.textMuted)),
        ],
      ),
    );
  }
}

class _StagesCard extends StatelessWidget {
  const _StagesCard();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final steps = [
      (l(uz: 'Ariza topshirildi', cy: 'Ариза топширилди', ru: 'Заявка подана', en: 'Application submitted'), true, false),
      (l(uz: 'Hujjatlar tekshiruvi', cy: 'Ҳужжатлар текшируви', ru: 'Проверка документов', en: 'Documents review'), false, true),
      (l(uz: 'Shartnoma imzosi', cy: 'Шартнома имзоси', ru: 'Подпись договора', en: 'Contract signing'), false, false),
      (l(uz: "A'zolik tasdiqlandi", cy: 'Аъзолик тасдиқланди', ru: 'Членство подтверждено', en: 'Membership approved'), false, false),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Ariza bosqichlari', cy: 'Ариза босқичлари', ru: 'Этапы заявки', en: 'Application stages')),
          const SizedBox(height: AppSpace.md),
          for (var i = 0; i < steps.length; i++) ...[
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: steps[i].$2 || steps[i].$3 ? AppTokens.primary : const Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    steps[i].$2 ? '1' : '${i + 1}',
                    style: TextStyle(color: steps[i].$2 || steps[i].$3 ? Colors.white : AppTokens.textMuted, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: AppSpace.md),
                Expanded(
                  child: Text(
                    steps[i].$1,
                    style: TextStyle(fontWeight: steps[i].$3 ? FontWeight.w700 : FontWeight.w500, color: steps[i].$3 ? AppTokens.primaryDark : AppTokens.text),
                  ),
                ),
                if (steps[i].$3)
                  Text(
                    l(uz: 'Jarayonda', cy: 'Жараёнда', ru: 'В процессе', en: 'In progress'),
                    style: const TextStyle(fontSize: 12, color: AppTokens.primaryDark, fontWeight: FontWeight.w700),
                  ),
              ],
            ),
            if (i != steps.length - 1) const Padding(padding: EdgeInsets.only(left: 14), child: SizedBox(height: 18, child: VerticalDivider(thickness: 2))),
          ],
        ],
      ),
    );
  }
}

class _DocumentStatusCard extends StatelessWidget {
  const _DocumentStatusCard();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Hujjatlar holati', cy: 'Ҳужжатлар ҳолати', ru: 'Состояние документов', en: 'Documents status')),
          const SizedBox(height: AppSpace.md),
          _DocLine(l(uz: 'NGO Ustavi', cy: 'НГО Устави', ru: 'Устав НКО', en: 'NGO Charter'), l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждён', en: 'Approved'), const Color(0xFF0F7B4B)),
          _DocLine(l(uz: 'Guvohnoma', cy: 'Гувоҳнома', ru: 'Свидетельство', en: 'Certificate'), l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждён', en: 'Approved'), const Color(0xFF0F7B4B)),
          _DocLine(l(uz: 'Ustav yangi tahrir', cy: 'Устав янги таҳрир', ru: 'Устав (новая редакция)', en: 'Charter (new edition)'), l(uz: 'Muddatli', cy: 'Муддатли', ru: 'Просрочен', en: 'Overdue'), const Color(0xFFB45309)),
          _DocLine(l(uz: 'Soliq malumotnoma', cy: 'Солиқ маълумотнома', ru: 'Налоговая справка', en: 'Tax reference'), l(uz: 'Kutilmoqda', cy: 'Кутилмоқда', ru: 'Ожидается', en: 'Pending'), AppTokens.textMuted),
        ],
      ),
    );
  }
}

class _DocLine extends StatelessWidget {
  final String name;
  final String status;
  final Color color;
  const _DocLine(this.name, this.status, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: Row(
        children: [
          Expanded(child: Text(name)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 4),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(999)),
            child: Text(status, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _RecentActionsCard extends StatelessWidget {
  const _RecentActionsCard();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final actions = [
      (l(uz: 'Ariza muvaffaqiyatli yuborildi', cy: 'Ариза муваффақиятли юборилди', ru: 'Заявка успешно подана', en: 'Application successfully submitted'), '02.04.2026 · ARZ-2026-0418', AppTokens.primary),
      (l(uz: 'Hujjatlar tekshiruv bosqichiga otdi', cy: 'Ҳужжатлар текшируш босқичига ўтди', ru: 'Документы переданы на проверку', en: 'Documents moved to review stage'), '03.04.2026 · Admin', AppTokens.primaryDark),
      (l(uz: "Qo'shimcha hujjat so'raldi", cy: "Қўшимча ҳужжат сўралди", ru: 'Запрошен дополнительный документ', en: 'Additional document requested'), '04.04.2026 · ${l(uz: 'Muddat', cy: 'Муддат', ru: 'Срок', en: 'Deadline')}: 10.04.2026', const Color(0xFFF59E0B)),
      (l(uz: 'Shartnoma loyihasi tayyorlandi', cy: 'Шартнома лойиҳаси тайёрланди', ru: 'Подготовлен проект договора', en: 'Contract draft prepared'), '05.04.2026', const Color(0xFF16A34A)),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: "So'nggi harakatlar", cy: 'Сўнгги ҳаракатлар', ru: 'Последние действия', en: 'Recent activity')),
          const SizedBox(height: AppSpace.md),
          for (final action in actions)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 8, height: 8, margin: const EdgeInsets.only(top: 6), decoration: BoxDecoration(color: action.$3, shape: BoxShape.circle)),
                  const SizedBox(width: AppSpace.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(action.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text(action.$2, style: const TextStyle(color: AppTokens.textMuted, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final news = [
      (
        l(uz: 'YANGILIK', cy: 'ЯНГИЛИК', ru: 'НОВОСТЬ', en: 'NEWS'),
        l(uz: "OzNNTMA 2026-yil a'zolik shartlari elon qilindi", cy: "ЎзННТМА 2026-йил аъзолик шартлари эълон қилинди", ru: 'Объявлены условия членства ОзНВЗА на 2026 год', en: 'OzNNTMA 2026 membership terms announced'),
        '05.04.2026',
        const Color(0xFFE0F2FE),
        AppTokens.primaryDark,
      ),
      (
        l(uz: 'TADBIR', cy: 'ТАДБИР', ru: 'МЕРОПРИЯТИЕ', en: 'EVENT'),
        l(uz: 'NNT vakillari uchun seminar: 15.04.2026', cy: 'ННТ вакиллари учун семинар: 15.04.2026', ru: 'Семинар для представителей НКО: 15.04.2026', en: 'Seminar for NGO representatives: 15.04.2026'),
        '03.04.2026',
        const Color(0xFFFFF7ED),
        const Color(0xFFB45309),
      ),
      (
        l(uz: 'MUHIM', cy: 'МУҲИМ', ru: 'ВАЖНО', en: 'IMPORTANT'),
        l(uz: "Yangi a'zolik tartibi va hujjatlar ro'yxati", cy: "Янги аъзолик тартиби ва ҳужжатлар рўйхати", ru: 'Новый порядок членства и перечень документов', en: 'New membership procedure and documents list'),
        '01.04.2026',
        const Color(0xFFFEF3C7),
        const Color(0xFF92400E),
      ),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Yangiliklar', cy: 'Янгиликлар', ru: 'Новости', en: 'News')),
          const SizedBox(height: AppSpace.md),
          for (var i = 0; i < news.length; i++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 2),
                  decoration: BoxDecoration(color: news[i].$4, borderRadius: BorderRadius.circular(6)),
                  child: Text(news[i].$1, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: news[i].$5)),
                ),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news[i].$2, style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text(news[i].$3, style: const TextStyle(fontSize: 12, color: AppTokens.textMuted)),
                    ],
                  ),
                ),
              ],
            ),
            if (i != news.length - 1) const Padding(padding: EdgeInsets.symmetric(vertical: AppSpace.sm), child: Divider(height: 1)),
          ],
        ],
      ),
    );
  }
}

// ─── Ariza tab ────────────────────────────────────────────────────────────────

class _AppFilterChips extends StatelessWidget {
  const _AppFilterChips();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return Wrap(
      spacing: AppSpace.sm,
      children: [
        _FilterChip(l(uz: 'Faol', cy: 'Фаол', ru: 'Активные', en: 'Active'), '1', true),
        _FilterChip(l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждено', en: 'Approved'), '0', false),
        _FilterChip(l(uz: 'Arxiv', cy: 'Архив', ru: 'Архив', en: 'Archive'), '0', false),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String count;
  final bool active;
  const _FilterChip(this.label, this.count, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
      decoration: BoxDecoration(
        color: active ? AppTokens.primaryDark : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: active ? AppTokens.primaryDark : AppTokens.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: active ? Colors.white : AppTokens.text, fontWeight: FontWeight.w700)),
          const SizedBox(width: AppSpace.xs),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: active ? const Color(0x33000000) : const Color(0xFFEAF2F7),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(count, style: TextStyle(fontSize: 11, color: active ? Colors.white : AppTokens.textMuted, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _MiniMetric(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.sm),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: color, height: 1.1)),
        ],
      ),
    );
  }
}

class _ApplicationStages extends StatelessWidget {
  const _ApplicationStages();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final stageLabels = [
      l(uz: 'Ariza topshirildi', cy: 'Ариза топширилди', ru: 'Заявка подана', en: 'Application submitted'),
      l(uz: 'Hujjatlar tekshiruvi', cy: 'Ҳужжатлар текшируви', ru: 'Проверка документов', en: 'Documents review'),
      l(uz: 'Shartnoma imzosi', cy: 'Шартнома имзоси', ru: 'Подпись договора', en: 'Contract signing'),
      l(uz: "A'zolik tasdiqlandi", cy: 'Аъзолик тасдиқланди', ru: 'Членство подтверждено', en: 'Membership approved'),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Ariza bosqichlari', cy: 'Ариза босқичлари', ru: 'Этапы заявки', en: 'Application stages')),
          const SizedBox(height: AppSpace.md),
          for (var i = 0; i < stageLabels.length; i++) ...[
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: i <= 1 ? AppTokens.primaryDark : const Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(color: i <= 1 ? Colors.white : AppTokens.textMuted, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: AppSpace.md),
                Expanded(
                  child: Text(
                    stageLabels[i],
                    style: TextStyle(color: i == 1 ? AppTokens.primaryDark : AppTokens.text, fontWeight: i == 1 ? FontWeight.w700 : FontWeight.w500),
                  ),
                ),
                if (i == 1)
                  Text(
                    l(uz: 'Jarayonda', cy: 'Жараёнда', ru: 'В процессе', en: 'In progress'),
                    style: const TextStyle(fontSize: 12, color: AppTokens.primaryDark, fontWeight: FontWeight.w700),
                  ),
              ],
            ),
            if (i != stageLabels.length - 1) const Padding(padding: EdgeInsets.only(left: 14), child: SizedBox(height: 16, child: VerticalDivider(thickness: 2))),
          ],
        ],
      ),
    );
  }
}

class _HistoryTable extends StatelessWidget {
  const _HistoryTable();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Ariza tarixi', cy: 'Ариза тарихи', ru: 'История заявки', en: 'Application history')),
          const SizedBox(height: AppSpace.md),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 42,
              dataRowMinHeight: 48,
              dataRowMaxHeight: 56,
              columnSpacing: 24,
              columns: [
                DataColumn(label: _NoWrap(l(uz: 'Tadbir', cy: 'Тадбир', ru: 'Событие', en: 'Event'))),
                DataColumn(label: _NoWrap(l(uz: 'Tavsif', cy: 'Тавсиф', ru: 'Описание', en: 'Description'))),
                DataColumn(label: _NoWrap(l(uz: 'Sana', cy: 'Сана', ru: 'Дата', en: 'Date'))),
                DataColumn(label: _NoWrap(l(uz: 'Kim', cy: 'Ким', ru: 'Кем', en: 'By'))),
                DataColumn(label: _NoWrap(l(uz: 'Holat', cy: 'Ҳолат', ru: 'Статус', en: 'Status'))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(_NoWrap(l(uz: 'Ariza yuborildi', cy: 'Ариза юборилди', ru: 'Заявка подана', en: 'Application submitted'))),
                  DataCell(_NoWrap(l(uz: "A'zolik arizasi muvaffaqiyatli yuborildi", cy: 'Аъзолик аризаси муваффақиятли юборилди', ru: 'Членская заявка успешно подана', en: 'Membership application successfully submitted'))),
                  const DataCell(_NoWrap('02.04.2026')),
                  const DataCell(_NoWrap('Kamolov Sanjar')),
                  DataCell(_StatusPill(l(uz: 'Bajarildi', cy: 'Бажарилди', ru: 'Выполнено', en: 'Completed'), const Color(0xFF0F7B4B))),
                ]),
                DataRow(cells: [
                  DataCell(_NoWrap(l(uz: 'Tekshiruv boshlandi', cy: 'Текшириш бошланди', ru: 'Проверка начата', en: 'Review started'))),
                  DataCell(_NoWrap(l(uz: "Hujjatlar tekshiruv bosqichiga o'tkazildi", cy: 'Ҳужжатлар текшириш босқичига ўтказилди', ru: 'Документы переданы на проверку', en: 'Documents moved to review stage'))),
                  const DataCell(_NoWrap('03.04.2026')),
                  const DataCell(_NoWrap('Admin')),
                  DataCell(_StatusPill(l(uz: 'Bajarildi', cy: 'Бажарилди', ru: 'Выполнено', en: 'Completed'), const Color(0xFF0F7B4B))),
                ]),
                DataRow(cells: [
                  DataCell(_NoWrap(l(uz: 'Hujjat soʻraldi', cy: 'Ҳужжат сўралди', ru: 'Запрошен документ', en: 'Document requested'))),
                  DataCell(_NoWrap(l(uz: 'Ustav yangi tahrir soʻraldi', cy: 'Устав янги таҳрир сўралди', ru: 'Запрошен устав (новая редакция)', en: 'Charter (new edition) requested'))),
                  const DataCell(_NoWrap('04.04.2026')),
                  const DataCell(_NoWrap('Admin')),
                  DataCell(_StatusPill(l(uz: 'Kutilmoqda', cy: 'Кутилмоқда', ru: 'Ожидается', en: 'Pending'), const Color(0xFFB45309))),
                ]),
                DataRow(cells: [
                  DataCell(_NoWrap(l(uz: 'Shartnoma loyihasi', cy: 'Шартнома лойиҳаси', ru: 'Проект договора', en: 'Contract draft'))),
                  DataCell(_NoWrap(l(uz: "A'zolik shartnomasi loyihasi tayyorlandi", cy: 'Аъзолик шартномаси лойиҳаси тайёрланди', ru: 'Подготовлен проект договора о членстве', en: 'Membership contract draft prepared'))),
                  const DataCell(_NoWrap('05.04.2026')),
                  const DataCell(_NoWrap('Admin')),
                  DataCell(_StatusPill(l(uz: 'Imzo kutilmoqda', cy: 'Имзо кутилмоқда', ru: 'Ожидается подпись', en: 'Awaiting signature'), AppTokens.textMuted)),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Hujjatlar tab ────────────────────────────────────────────────────────────

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const _KpiCard(this.title, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.sm),
          Text(value, style: TextStyle(fontSize: 28, color: color, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetCard(
      child: Row(
        children: [
          const SizedBox(
            width: 96,
            height: 96,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(width: 96, height: 96, child: CircularProgressIndicator(value: 0.43, strokeWidth: 10, color: AppTokens.primaryDark, backgroundColor: Color(0xFFE2E8F0))),
                Text('43%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l(uz: '3 / 7 hujjat qabul qilindi', cy: '3 / 7 ҳужжат қабул қилинди', ru: '3 / 7 документов принято', en: '3 / 7 documents accepted'),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  l(uz: '1 ta muddatli · 3 ta kutilmoqda', cy: '1 та муддатли · 3 та кутилмоқда', ru: '1 просрочен · 3 ожидаются', en: '1 overdue · 3 pending'),
                  style: const TextStyle(color: AppTokens.textMuted),
                ),
                const SizedBox(height: AppSpace.sm),
                _LegendLine(l(uz: 'Tasdiqlangan: 3', cy: 'Тасдиқланган: 3', ru: 'Подтверждено: 3', en: 'Approved: 3'), const Color(0xFF0F7B4B)),
                _LegendLine(l(uz: 'Muddatli: 1', cy: 'Муддатли: 1', ru: 'Просрочено: 1', en: 'Overdue: 1'), const Color(0xFFB45309)),
                _LegendLine(l(uz: 'Kutilmoqda: 3', cy: 'Кутилмоқда: 3', ru: 'Ожидается: 3', en: 'Pending: 3'), AppTokens.textMuted),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendLine extends StatelessWidget {
  final String text;
  final Color color;
  const _LegendLine(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: AppSpace.sm),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _DocumentsTable extends StatelessWidget {
  const _DocumentsTable();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetCard(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 42,
          dataRowMinHeight: 48,
          dataRowMaxHeight: 56,
          columnSpacing: 24,
          columns: [
            DataColumn(label: _NoWrap(l(uz: 'Hujjat nomi', cy: 'Ҳужжат номи', ru: 'Название документа', en: 'Document name'))),
            DataColumn(label: _NoWrap(l(uz: 'Turi', cy: 'Тури', ru: 'Тип', en: 'Type'))),
            DataColumn(label: _NoWrap(l(uz: 'Muddat', cy: 'Муддат', ru: 'Срок', en: 'Deadline'))),
            DataColumn(label: _NoWrap(l(uz: 'Holat', cy: 'Ҳолат', ru: 'Статус', en: 'Status'))),
            DataColumn(label: _NoWrap(l(uz: 'Amal', cy: 'Амал', ru: 'Действие', en: 'Action'))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(_NoWrap(l(uz: 'NGO Ustavi', cy: 'НГО Устави', ru: 'Устав НКО', en: 'NGO Charter'))),
              DataCell(_NoWrap(l(uz: 'Majburiy', cy: 'Мажбурий', ru: 'Обязательный', en: 'Required'))),
              const DataCell(_NoWrap('01.04.2026')),
              DataCell(_StatusPill(l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждён', en: 'Approved'), const Color(0xFF0F7B4B))),
              DataCell(_NoWrap(l(uz: "Ko'rish", cy: 'Кўриш', ru: 'Просмотр', en: 'View'))),
            ]),
            DataRow(cells: [
              DataCell(_NoWrap(l(uz: "Davlat ro'yxatidan o'tish guvohnomasi", cy: 'Давлат рўйхатидан ўтиш гувоҳномаси', ru: 'Свидетельство о государственной регистрации', en: 'State registration certificate'))),
              DataCell(_NoWrap(l(uz: 'Majburiy', cy: 'Мажбурий', ru: 'Обязательный', en: 'Required'))),
              const DataCell(_NoWrap('01.04.2026')),
              DataCell(_StatusPill(l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждён', en: 'Approved'), const Color(0xFF0F7B4B))),
              DataCell(_NoWrap(l(uz: "Ko'rish", cy: 'Кўриш', ru: 'Просмотр', en: 'View'))),
            ]),
            DataRow(cells: [
              DataCell(_NoWrap(l(uz: 'Ustav yangi tahrir (2026-yil)', cy: 'Устав янги таҳрир (2026-йил)', ru: 'Устав (новая редакция, 2026)', en: 'Charter (new edition, 2026)'))),
              DataCell(_NoWrap(l(uz: 'Majburiy', cy: 'Мажбурий', ru: 'Обязательный', en: 'Required'))),
              const DataCell(_NoWrap('10.04.2026')),
              DataCell(_StatusPill(l(uz: 'Muddatli', cy: 'Муддатли', ru: 'Просрочен', en: 'Overdue'), const Color(0xFFB45309))),
              DataCell(_NoWrap(l(uz: 'Yuklash', cy: 'Юклаш', ru: 'Загрузить', en: 'Upload'))),
            ]),
            DataRow(cells: [
              DataCell(_NoWrap(l(uz: 'Soliq organidan malumotnoma', cy: 'Солиқ органидан маълумотнома', ru: 'Справка из налоговых органов', en: 'Tax authority reference'))),
              DataCell(_NoWrap(l(uz: 'Majburiy', cy: 'Мажбурий', ru: 'Обязательный', en: 'Required'))),
              const DataCell(_NoWrap('-')),
              DataCell(_StatusPill(l(uz: 'Yuklanmagan', cy: 'Юкланмаган', ru: 'Не загружен', en: 'Not uploaded'), AppTokens.textMuted)),
              DataCell(_NoWrap(l(uz: 'Yuklash', cy: 'Юклаш', ru: 'Загрузить', en: 'Upload'))),
            ]),
          ],
        ),
      ),
    );
  }
}

class _UploadPanel extends StatelessWidget {
  const _UploadPanel();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: 'Yangi hujjat yuklash', cy: 'Янги ҳужжат юклаш', ru: 'Загрузить новый документ', en: 'Upload new document')),
          const SizedBox(height: AppSpace.md),
          AdaptiveGrid(
            minCardWidth: 280,
            maxColumns: 2,
            children: [
              _LabeledField(
                l(uz: 'Hujjat turi', cy: 'Ҳужжат тури', ru: 'Тип документа', en: 'Document type'),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(value: '1', child: Text(l(uz: 'Ustav yangi tahrir (2026-yil)', cy: 'Устав янги таҳрир (2026-йил)', ru: 'Устав (новая редакция, 2026)', en: 'Charter (new edition, 2026)'))),
                    DropdownMenuItem(value: '2', child: Text(l(uz: 'Soliq organidan malumotnoma', cy: 'Солиқ органидан маълумотнома', ru: 'Справка из налоговых органов', en: 'Tax authority reference'))),
                    DropdownMenuItem(value: '3', child: Text(l(uz: 'Tashkilot nizomi', cy: 'Ташкилот низоми', ru: 'Устав организации', en: 'Organization statutes'))),
                  ],
                  onChanged: null,
                  hint: Text(l(uz: 'Hujjat turini tanlang', cy: 'Ҳужжат турини танланг', ru: 'Выберите тип документа', en: 'Select document type')),
                ),
              ),
              _LabeledField(
                l(uz: 'Fayl (PDF, DOC - maks. 10 MB)', cy: 'Файл (PDF, DOC - макс. 10 МБ)', ru: 'Файл (PDF, DOC - макс. 10 МБ)', en: 'File (PDF, DOC - max. 10 MB)'),
                TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: l(uz: 'Fayl tanlash', cy: 'Файл танлаш', ru: 'Выберите файл', en: 'Select file'))),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.md),
          FilledButton.icon(
            onPressed: () {},
            icon: const PhosphorIcon(PhosphorIconsRegular.uploadSimple),
            label: Text(l(uz: 'Yuklash', cy: 'Юклаш', ru: 'Загрузить', en: 'Upload')),
          ),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  const _LabeledField(this.label, this.child);

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

// ─── Shared ───────────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  final String text;
  final Color color;
  const _StatusPill(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 4),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(999)),
      child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w700)),
    );
  }
}

class _NoWrap extends StatelessWidget {
  final String text;
  const _NoWrap(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false);
  }
}
