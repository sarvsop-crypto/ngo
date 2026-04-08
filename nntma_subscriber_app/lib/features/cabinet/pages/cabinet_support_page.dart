import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/app_i18n.dart';
import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetSupportPage extends StatelessWidget {
  const CabinetSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return CabinetPageScaffold(
      eyebrow: l(uz: 'Murojaat', cy: 'Мурожаат', ru: 'Обращения', en: 'Requests'),
      title: l(uz: 'Murojaat va Yordam', cy: 'Мурожаат ва ёрдам', ru: 'Обращения и поддержка', en: 'Requests and support'),
      subtitle: l(
        uz: "Ko'p so'raladigan savollarga javob toping yoki bizga yozing.",
        cy: 'Кўп сўраладиган саволларга жавоб топинг ёки бизга ёзинг.',
        ru: 'Найдите ответы на частые вопросы или напишите нам.',
        en: 'Find answers to common questions or write to us.',
      ),
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            onPressed: () {},
            icon: const PhosphorIcon(PhosphorIconsRegular.plus),
            label: Text(l(uz: 'Yangi murojaat', cy: 'Янги мурожаат', ru: 'Новое обращение', en: 'New request')),
          ),
        ),
        const SizedBox(height: AppSpace.xl),
        const AdaptiveGrid(
          minCardWidth: 360,
          maxColumns: 2,
          children: [
            _FaqPanel(),
            _SupportSidePanel(),
          ],
        ),
      ],
    );
  }
}

class _FaqPanel extends StatelessWidget {
  const _FaqPanel();

  @override
  Widget build(BuildContext context) {
    final faqs = [
      (
        context.i18n.pick(uzLatin: "A'zolik arizasi qancha vaqt ko'rib chiqiladi?", uzCyrillic: 'Аъзолик аризаси қанча вақт кўриб чиқилади?', russian: 'Сколько рассматривается заявка на членство?', english: 'How long does membership review take?'),
        context.i18n.pick(uzLatin: "Ariza odatda 10-15 ish kuni ichida ko'rib chiqiladi.", uzCyrillic: 'Ариза одатда 10-15 иш куни ичида кўриб чиқилади.', russian: 'Обычно заявка рассматривается за 10-15 рабочих дней.', english: 'Usually, applications are reviewed within 10-15 business days.'),
      ),
      (
        context.i18n.pick(uzLatin: 'Qanday hujjatlar talab qilinadi?', uzCyrillic: 'Қандай ҳужжатлар талаб қилинади?', russian: 'Какие документы требуются?', english: 'Which documents are required?'),
        context.i18n.pick(uzLatin: "NNT Ustavi, guvohnoma, rahbar ma'lumotnomasi, soliq ma'lumotnomasi talab qilinadi.", uzCyrillic: 'ННТ Устави, гувоҳнома, раҳбар маълумотномаси, солиқ маълумотномаси талаб қилинади.', russian: 'Требуются устав ННО, свидетельство, данные руководителя и налоговая справка.', english: 'NGO charter, certificate, leader details, and tax reference are required.'),
      ),
      (
        context.i18n.pick(uzLatin: "Hujjat qaytarilsa nima qilish kerak?", uzCyrillic: 'Ҳужжат қайтарилса нима қилиш керак?', russian: 'Что делать, если документ отклонили?', english: 'What if a document is returned?'),
        context.i18n.pick(uzLatin: "Admin izohiga asosan tuzatib qayta yuklash kerak.", uzCyrillic: 'Админ изоҳига асосан тузатиб қайта юклаш керак.', russian: 'Исправьте по комментарию администратора и загрузите повторно.', english: 'Fix according to admin comments and upload again.'),
      ),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(context.i18n.pick(uzLatin: "Ko'p so'raladigan savollar", uzCyrillic: 'Кўп сўраладиган саволлар', russian: 'Часто задаваемые вопросы', english: 'Frequently asked questions')),
          const SizedBox(height: AppSpace.md),
          for (var i = 0; i < faqs.length; i++) ...[
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: AppSpace.sm),
              title: Text(faqs[i].$1, style: const TextStyle(fontWeight: FontWeight.w600)),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(faqs[i].$2, style: const TextStyle(color: AppTokens.textMuted)),
                ),
              ],
            ),
            if (i != faqs.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class _SupportSidePanel extends StatelessWidget {
  const _SupportSidePanel();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return Column(
      children: [
        CabinetCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CabinetCardTitle(l(uz: "Bog'lanish", cy: 'Боғланиш', ru: 'Контакты', en: 'Contact')),
              const SizedBox(height: AppSpace.md),
              _ContactRow(PhosphorIconsRegular.phone, l(uz: 'Telefon', cy: 'Телефон', ru: 'Телефон', en: 'Phone'), '(+998 55) 503-05-12'),
              _ContactRow(PhosphorIconsRegular.envelope, 'Email', 'info@uznntma.uz'),
              _ContactRow(
                PhosphorIconsRegular.mapPin,
                l(uz: 'Manzil', cy: 'Манзил', ru: 'Адрес', en: 'Address'),
                l(uz: "1A, Furqat ko'chasi, Toshkent", cy: '1A, Фурқат кўчаси, Тошкент', ru: 'ул. Фурката, 1A, Ташкент', en: '1A Furqat street, Tashkent'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpace.md),
        CabinetCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CabinetCardTitle(l(uz: 'Murojaat yuborish', cy: 'Мурожаат юбориш', ru: 'Отправить обращение', en: 'Send a request')),
              const SizedBox(height: AppSpace.md),
              _LabeledInput(
                l(uz: 'Mavzu', cy: 'Мавзу', ru: 'Тема', en: 'Subject'),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(value: 'h', child: Text(l(uz: "Hujjatlar bo'yicha", cy: 'Ҳужжатлар бўйича', ru: 'По документам', en: 'About documents'))),
                    DropdownMenuItem(value: 'a', child: Text(l(uz: 'Ariza holati', cy: 'Ариза ҳолати', ru: 'Статус заявки', en: 'Application status'))),
                    DropdownMenuItem(value: 't', child: Text(l(uz: 'Texnik muammo', cy: 'Техник муаммо', ru: 'Техническая проблема', en: 'Technical issue'))),
                  ],
                  onChanged: null,
                  hint: Text(l(uz: 'Tanlang', cy: 'Танланг', ru: 'Выберите', en: 'Select')),
                ),
              ),
              const SizedBox(height: AppSpace.md),
              _LabeledInput(
                l(uz: 'Muhimlik darajasi', cy: 'Муҳимлик даражаси', ru: 'Уровень важности', en: 'Priority level'),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(value: '1', child: Text(l(uz: 'Oddiy', cy: 'Оддий', ru: 'Обычный', en: 'Normal'))),
                    DropdownMenuItem(value: '2', child: Text(l(uz: "O'rta", cy: 'Ўрта', ru: 'Средний', en: 'Medium'))),
                    DropdownMenuItem(value: '3', child: Text(l(uz: 'Shoshilinch', cy: 'Шошилинч', ru: 'Срочный', en: 'Urgent'))),
                  ],
                  onChanged: null,
                  hint: Text(l(uz: 'Tanlang', cy: 'Танланг', ru: 'Выберите', en: 'Select')),
                ),
              ),
              const SizedBox(height: AppSpace.md),
              _LabeledInput(
                l(uz: 'Xabar', cy: 'Хабар', ru: 'Сообщение', en: 'Message'),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: l(uz: 'Muammoingizni batafsil yozing...', cy: 'Муаммоингизни батафсил ёзинг...', ru: 'Опишите проблему подробно...', en: 'Describe your issue in detail...'),
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.md),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: null,
                  icon: const PhosphorIcon(PhosphorIconsRegular.paperPlaneTilt),
                  label: Text(l(uz: 'Yuborish', cy: 'Юбориш', ru: 'Отправить', en: 'Send')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.md),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(color: Color(0xFFEAF2F7), shape: BoxShape.circle),
            alignment: Alignment.center,
            child: PhosphorIcon(icon, size: 18, color: AppTokens.primaryDark),
          ),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: AppTokens.textMuted)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
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
