import 'package:flutter/material.dart';

import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetDocumentsPage extends StatelessWidget {
  const CabinetDocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CabinetPageScaffold(
      eyebrow: 'Hujjatlar',
      title: 'Hujjatlar toplami va yuklash',
      children: [
        AdaptiveGrid(
          minCardWidth: 180,
          maxColumns: 4,
          children: const [
            _KpiCard('Tasdiqlangan', '3', Color(0xFF0F7B4B)),
            _KpiCard('Muddatli', '1', Color(0xFFB45309)),
            _KpiCard('Kutilmoqda', '3', AppTokens.textMuted),
            _KpiCard('Jami', '7', AppTokens.primaryDark),
          ],
        ),
        const SizedBox(height: AppSpace.lg),
        const _ProgressCard(),
        const SizedBox(height: AppSpace.lg),
        const CabinetSectionTitle('Hujjatlar toplami'),
        const SizedBox(height: AppSpace.md),
        const _DocumentsTable(),
        const SizedBox(height: AppSpace.lg),
        const _UploadPanel(),
      ],
    );
  }
}

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
    return CabinetCard(
      child: Row(
        children: const [
          SizedBox(
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
          SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('3 / 7 hujjat qabul qilindi', style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(height: AppSpace.xs),
                Text('1 ta muddatli · 3 ta kutilmoqda', style: TextStyle(color: AppTokens.textMuted)),
                SizedBox(height: AppSpace.sm),
                _LegendLine('Tasdiqlangan: 3', Color(0xFF0F7B4B)),
                _LegendLine('Muddatli: 1', Color(0xFFB45309)),
                _LegendLine('Kutilmoqda: 3', AppTokens.textMuted),
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
    return CabinetCard(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 42,
          dataRowMinHeight: 48,
          columns: const [
            DataColumn(label: Text('Hujjat nomi')),
            DataColumn(label: Text('Turi')),
            DataColumn(label: Text('Muddat')),
            DataColumn(label: Text('Holat')),
            DataColumn(label: Text('Amal')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('NGO Ustavi')),
              DataCell(Text('Majburiy')),
              DataCell(Text('01.04.2026')),
              DataCell(_StatusPill('Tasdiqlangan', Color(0xFF0F7B4B))),
              DataCell(Text('Korish')),
            ]),
            DataRow(cells: [
              DataCell(Text('Davlat royxatidan otish guvohnomasi')),
              DataCell(Text('Majburiy')),
              DataCell(Text('01.04.2026')),
              DataCell(_StatusPill('Tasdiqlangan', Color(0xFF0F7B4B))),
              DataCell(Text('Korish')),
            ]),
            DataRow(cells: [
              DataCell(Text('Ustav yangi tahrir (2026-yil)')),
              DataCell(Text('Majburiy')),
              DataCell(Text('10.04.2026')),
              DataCell(_StatusPill('Muddatli', Color(0xFFB45309))),
              DataCell(Text('Yuklash')),
            ]),
            DataRow(cells: [
              DataCell(Text('Soliq organidan malumotnoma')),
              DataCell(Text('Majburiy')),
              DataCell(Text('-')),
              DataCell(_StatusPill('Yuklanmagan', AppTokens.textMuted)),
              DataCell(Text('Yuklash')),
            ]),
          ],
        ),
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
      child: Text(text, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w700)),
    );
  }
}

class _UploadPanel extends StatelessWidget {
  const _UploadPanel();

  @override
  Widget build(BuildContext context) {
    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Yangi hujjat yuklash', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpace.md),
          AdaptiveGrid(
            minCardWidth: 280,
            maxColumns: 2,
            children: [
              _LabeledField('Hujjat turi', DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(value: '1', child: Text('Ustav yangi tahrir (2026-yil)')),
                  DropdownMenuItem(value: '2', child: Text('Soliq organidan malumotnoma')),
                  DropdownMenuItem(value: '3', child: Text('Tashkilot nizomi')),
                ],
                onChanged: null,
                hint: Text('Hujjat turini tanlang'),
              )),
              const _LabeledField('Fayl (PDF, DOC - maks. 10 MB)', TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Fayl tanlash'))),
            ],
          ),
          const SizedBox(height: AppSpace.md),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.upload_file_outlined), label: const Text('Yuklash')),
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
