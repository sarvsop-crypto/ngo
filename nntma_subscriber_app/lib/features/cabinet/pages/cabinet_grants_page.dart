import 'package:flutter/material.dart';

import '../../../core/app_i18n.dart';
import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetGrantsPage extends StatefulWidget {
  const CabinetGrantsPage({super.key});

  @override
  State<CabinetGrantsPage> createState() => _CabinetGrantsPageState();
}

class _CabinetGrantsPageState extends State<CabinetGrantsPage> {
  bool _showApplied = true;

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetPageScaffold(
      eyebrow: l(uz: 'Grantlar', cy: 'Грантлар', ru: 'Гранты', en: 'Grants'),
      title: l(uz: 'Ariza yuborilgan va erishilgan grantlar', cy: 'Ариза юборилган ва эришилган грантлар', ru: 'Поданные заявки и полученные гранты', en: 'Applied and received grants'),
      subtitle: l(uz: "Ariza yuborilgan va qo'lga kiritilgan grantlar ro'yxati.", cy: "Ариза юборилган ва қўлга киритилган грантлар рўйхати.", ru: 'Список поданных заявок и полученных грантов.', en: 'List of applied and received grants.'),
      children: [
        Row(
          children: [
            _TabChip(
              label: l(uz: 'Ariza yuborilgan', cy: 'Ариза юборилган', ru: 'Поданные заявки', en: 'Applied'),
              count: '3',
              active: _showApplied,
              onTap: () => setState(() => _showApplied = true),
            ),
            const SizedBox(width: AppSpace.sm),
            _TabChip(
              label: l(uz: 'Erishilgan', cy: 'Эришилган', ru: 'Полученные', en: 'Received'),
              count: '2',
              active: !_showApplied,
              onTap: () => setState(() => _showApplied = false),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.xl),
        if (_showApplied) ...[
          AdaptiveGrid(
            minCardWidth: 200,
            maxColumns: 4,
            children: [
              _MetricCard(l(uz: 'Jami ariza', cy: 'Жами ариза', ru: 'Всего заявок', en: 'Total applied'), '3', AppTokens.primaryDark),
              _MetricCard(l(uz: "Ko'rib chiqilmoqda", cy: 'Кўриб чиқилмоқда', ru: 'На рассмотрении', en: 'Under review'), '1', const Color(0xFFB45309)),
              _MetricCard(l(uz: 'Tasdiqlangan', cy: 'Тасдиқланган', ru: 'Подтверждено', en: 'Approved'), '1', const Color(0xFF0F7B4B)),
              _MetricCard(l(uz: 'Rad etildi', cy: 'Рад этилди', ru: 'Отклонено', en: 'Rejected'), '1', const Color(0xFFBE123C)),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          _GrantsTable(
            title: l(uz: 'Ariza yuborilgan grantlar', cy: 'Ариза юборилган грантлар', ru: 'Гранты с поданными заявками', en: 'Applied grants'),
            colGrant: l(uz: 'Grant nomi', cy: 'Грант номи', ru: 'Название гранта', en: 'Grant name'),
            colDonor: l(uz: 'Donor', cy: 'Донор', ru: 'Донор', en: 'Donor'),
            colAmount: l(uz: 'Summa', cy: 'Сумма', ru: 'Сумма', en: 'Amount'),
            colDate: l(uz: 'Sana', cy: 'Сана', ru: 'Дата', en: 'Date'),
            colStatus: l(uz: 'Holat', cy: 'Ҳолат', ru: 'Статус', en: 'Status'),
            rows: [
              (
                l(uz: 'Fuqarolik jamiyatini mustahkamlash granti', cy: 'Фуқаролик жамиятини мустаҳкамлаш гранти', ru: 'Грант по укреплению гражданского общества', en: 'Civil society strengthening grant'),
                'USAID Uzbekistan',
                '\$15,000',
                '10.01.2026',
                l(uz: "Ko'rib chiqilmoqda", cy: 'Кўриб чиқилмоқда', ru: 'На рассмотрении', en: 'Under review'),
                const Color(0xFFB45309),
              ),
              (
                l(uz: 'Yoshlar faolligini oshirish loyihasi', cy: 'Ёшлар фаоллигини ошириш лойиҳаси', ru: 'Проект повышения активности молодёжи', en: 'Youth activity enhancement project'),
                'UNDP Uzbekistan',
                '\$8,500',
                '15.02.2026',
                l(uz: 'Tasdiqlandi', cy: 'Тасдиқланди', ru: 'Подтверждено', en: 'Approved'),
                const Color(0xFF0F7B4B),
              ),
              (
                l(uz: 'NNTlar salohiyatini rivojlantirish', cy: 'ННТлар салоҳиятини ривожлантириш', ru: 'Развитие потенциала НКО', en: 'NGO capacity development'),
                'EU Delegation',
                '\$12,000',
                '20.03.2026',
                l(uz: 'Rad etildi', cy: 'Рад этилди', ru: 'Отклонено', en: 'Rejected'),
                const Color(0xFFBE123C),
              ),
            ],
          ),
        ] else ...[
          AdaptiveGrid(
            minCardWidth: 200,
            maxColumns: 4,
            children: [
              _MetricCard(l(uz: 'Jami erishilgan', cy: 'Жами эришилган', ru: 'Всего получено', en: 'Total received'), '2', const Color(0xFF0F7B4B)),
              _MetricCard(l(uz: 'Faol loyihalar', cy: 'Фаол лойиҳалар', ru: 'Активные проекты', en: 'Active projects'), '1', AppTokens.primaryDark),
              _MetricCard(l(uz: 'Yakunlangan', cy: 'Якунланган', ru: 'Завершено', en: 'Completed'), '1', AppTokens.textMuted),
              _MetricCard(l(uz: 'Jami jalb etilgan', cy: 'Жами жалб этилган', ru: 'Всего привлечено', en: 'Total raised'), '\$18,500', AppTokens.primaryDark),
            ],
          ),
          const SizedBox(height: AppSpace.xl),
          _GrantsTable(
            title: l(uz: 'Erishilgan grantlar', cy: 'Эришилган грантлар', ru: 'Полученные гранты', en: 'Received grants'),
            colGrant: l(uz: 'Grant nomi', cy: 'Грант номи', ru: 'Название гранта', en: 'Grant name'),
            colDonor: l(uz: 'Donor', cy: 'Донор', ru: 'Донор', en: 'Donor'),
            colAmount: l(uz: 'Summa', cy: 'Сумма', ru: 'Сумма', en: 'Amount'),
            colDate: l(uz: 'Sana', cy: 'Сана', ru: 'Дата', en: 'Date'),
            colStatus: l(uz: 'Holat', cy: 'Ҳолат', ru: 'Статус', en: 'Status'),
            rows: [
              (
                l(uz: 'Yoshlar faolligini oshirish loyihasi', cy: 'Ёшлар фаоллигини ошириш лойиҳаси', ru: 'Проект повышения активности молодёжи', en: 'Youth activity enhancement project'),
                'UNDP Uzbekistan',
                '\$8,500',
                '01.03.2026',
                l(uz: 'Faol', cy: 'Фаол', ru: 'Активный', en: 'Active'),
                const Color(0xFF0F7B4B),
              ),
              (
                l(uz: 'Jamoat nazorati va hisobdorlik', cy: 'Жамоат назорати ва ҳисобдорлик', ru: 'Общественный контроль и подотчётность', en: 'Public oversight and accountability'),
                'NED',
                '\$10,000',
                '01.09.2025',
                l(uz: 'Yakunlangan', cy: 'Якунланган', ru: 'Завершено', en: 'Completed'),
                AppTokens.textMuted,
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final String count;
  final bool active;
  final VoidCallback onTap;

  const _TabChip({required this.label, required this.count, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
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
            Text(label, style: TextStyle(color: active ? Colors.white : AppTokens.text, fontWeight: FontWeight.w700)),
            const SizedBox(width: AppSpace.xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(color: active ? const Color(0x33000000) : const Color(0xFFEAF2F7), borderRadius: BorderRadius.circular(999)),
              child: Text(count, style: TextStyle(fontSize: 11, color: active ? Colors.white : AppTokens.textMuted, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MetricCard(this.title, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, color: AppTokens.textMuted)),
          const SizedBox(height: AppSpace.sm),
          Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: color)),
        ],
      ),
    );
  }
}

class _GrantsTable extends StatelessWidget {
  final String title;
  final String colGrant;
  final String colDonor;
  final String colAmount;
  final String colDate;
  final String colStatus;
  final List<(String, String, String, String, String, Color)> rows;

  const _GrantsTable({
    required this.title,
    required this.colGrant,
    required this.colDonor,
    required this.colAmount,
    required this.colDate,
    required this.colStatus,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(title),
          const SizedBox(height: AppSpace.md),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 42,
              dataRowMaxHeight: 56,
              columnSpacing: 24,
              columns: [
                DataColumn(label: _NoWrap(colGrant)),
                DataColumn(label: _NoWrap(colDonor)),
                DataColumn(label: _NoWrap(colAmount)),
                DataColumn(label: _NoWrap(colDate)),
                DataColumn(label: _NoWrap(colStatus)),
              ],
              rows: [
                for (final row in rows)
                  DataRow(cells: [
                    DataCell(_NoWrap(row.$1)),
                    DataCell(_NoWrap(row.$2)),
                    DataCell(_NoWrap(row.$3)),
                    DataCell(_NoWrap(row.$4)),
                    DataCell(_StatusPill(row.$5, row.$6)),
                  ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
