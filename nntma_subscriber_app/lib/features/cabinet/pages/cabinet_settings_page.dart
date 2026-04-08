import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/app_i18n.dart';
import '../../../core/app_tokens.dart';
import '../../../widgets/adaptive_grid.dart';
import '../../../widgets/cards.dart';
import '../../../widgets/contact_form.dart';
import '../widgets/cabinet_page_scaffold.dart';

class CabinetSettingsPage extends StatefulWidget {
  const CabinetSettingsPage({super.key});

  @override
  State<CabinetSettingsPage> createState() => _CabinetSettingsPageState();
}

class _CabinetSettingsPageState extends State<CabinetSettingsPage> {
  int _tab = 0;

  static const _tabIcons = [
    PhosphorIconsRegular.user,
    PhosphorIconsRegular.buildings,
    PhosphorIconsRegular.shieldCheck,
    PhosphorIconsRegular.question,
  ];

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final tabLabels = [
      l(uz: 'Profil', cy: 'Профил', ru: 'Профиль', en: 'Profile'),
      l(uz: 'Tashkilot', cy: 'Ташкилот', ru: 'Организация', en: 'Organization'),
      l(uz: 'Xavfsizlik', cy: 'Хавфсизлик', ru: 'Безопасность', en: 'Security'),
      l(uz: 'Yordam', cy: 'Ёрдам', ru: 'Помощь', en: 'Help'),
    ];
    final subtitles = [
      l(uz: 'Shaxsiy malumotlar va hisob sozlamalari.', cy: 'Шахсий маълумотлар ва ҳисоб созламалари.', ru: 'Личные данные и настройки аккаунта.', en: 'Personal information and account settings.'),
      l(uz: 'Tashkilot rekvizitlari va yuridik malumotlar.', cy: 'Ташкилот реквизитлари ва юридик маълумотлар.', ru: 'Реквизиты организации и юридические данные.', en: 'Organization details and legal information.'),
      l(uz: 'Parol va kirish xavfsizligi.', cy: 'Парол ва кириш хавфсизлиги.', ru: 'Пароль и безопасность входа.', en: 'Password and login security.'),
      l(uz: "Ko'p so'raladigan savollar, murojaat va aloqa.", cy: 'Кўп сўраладиган саволлар, мурожаат ва алоқа.', ru: 'Часто задаваемые вопросы, обращения и контакты.', en: 'Frequently asked questions, requests and contacts.'),
    ];

    return CabinetPageScaffold(
      eyebrow: l(uz: 'Sozlamalar', cy: 'Созламалар', ru: 'Настройки', en: 'Settings'),
      title: tabLabels[_tab],
      subtitle: subtitles[_tab],
      children: [
        AdaptiveGrid(
          minCardWidth: 180,
          maxColumns: 4,
          children: [
            for (var i = 0; i < _tabIcons.length; i++)
              GestureDetector(
                onTap: () => setState(() => _tab = i),
                child: _SettingsNavItem(_tabIcons[i], tabLabels[i], i == _tab),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.xl),
        if (_tab == 0) ...[
          CabinetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabinetCardTitle(l(uz: 'Shaxsiy malumotlar', cy: 'Шахсий маълумотлар', ru: 'Личные данные', en: 'Personal information')),
                const SizedBox(height: AppSpace.md),
                AdaptiveGrid(
                  minCardWidth: 280,
                  maxColumns: 2,
                  children: [
                    _LabeledInput(l(uz: 'Ism', cy: 'Исм', ru: 'Имя', en: 'Name'), TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'Kamolov Sanjar'))),
                    _LabeledInput('Email', TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'kamolov@yanginafas.uz'))),
                    _LabeledInput(l(uz: 'Telefon', cy: 'Телефон', ru: 'Телефон', en: 'Phone'), TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: '+998 90 123 45 67'))),
                    _LabeledInput(l(uz: 'Lavozim', cy: 'Лавозим', ru: 'Должность', en: 'Position'), TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: l(uz: 'Tashkilot rahbari', cy: 'Ташкилот раҳбари', ru: 'Руководитель организации', en: 'Organization head')))),
                  ],
                ),
                const SizedBox(height: AppSpace.md),
                Row(
                  children: [
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const PhosphorIcon(PhosphorIconsRegular.floppyDisk),
                      label: Text(l(uz: 'Saqlash', cy: 'Сақлаш', ru: 'Сохранить', en: 'Save')),
                    ),
                    const SizedBox(width: AppSpace.sm),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(l(uz: 'Bekor qilish', cy: 'Бекор қилиш', ru: 'Отмена', en: 'Cancel')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ] else if (_tab == 1) ...[
          CabinetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabinetCardTitle(l(uz: 'Tashkilot malumotlari', cy: 'Ташкилот маълумотлари', ru: 'Данные организации', en: 'Organization information')),
                const SizedBox(height: AppSpace.md),
                AdaptiveGrid(
                  minCardWidth: 280,
                  maxColumns: 2,
                  children: [
                    _LabeledInput(l(uz: 'Tashkilot nomi', cy: 'Ташкилот номи', ru: 'Название организации', en: 'Organization name'), TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'Yangi Nafas NGO'))),
                    _LabeledInput(
                      l(uz: 'Huquqiy maqom', cy: 'Ҳуқуқий мақом', ru: 'Правовой статус', en: 'Legal status'),
                      TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: l(uz: 'Nodavlat notijorat tashkilot', cy: 'Нодавлат нотижорат ташкилот', ru: 'Некоммерческая организация', en: 'Non-profit organization'))),
                    ),
                    _LabeledInput('STIR', TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: '123456789'))),
                    _LabeledInput(
                      l(uz: "Ro'yxatdan o'tish raqami", cy: "Рўйхатдан ўтиш рақами", ru: 'Регистрационный номер', en: 'Registration number'),
                      TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'NGO-2024-0042')),
                    ),
                    _LabeledInput(
                      l(uz: 'Manzil', cy: 'Манзил', ru: 'Адрес', en: 'Address'),
                      TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: l(uz: 'Toshkent sh., Yunusobod tumani', cy: 'Тошкент ш., Юнусобод тумани', ru: 'г. Ташкент, Юнусабадский р-н', en: 'Tashkent, Yunusobod district'))),
                    ),
                    _LabeledInput(l(uz: 'Telefon', cy: 'Телефон', ru: 'Телефон', en: 'Phone'), TextField(decoration: InputDecoration(border: const OutlineInputBorder(), hintText: '+998 71 000 00 00'))),
                  ],
                ),
                const SizedBox(height: AppSpace.md),
                Row(
                  children: [
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const PhosphorIcon(PhosphorIconsRegular.floppyDisk),
                      label: Text(l(uz: 'Saqlash', cy: 'Сақлаш', ru: 'Сохранить', en: 'Save')),
                    ),
                    const SizedBox(width: AppSpace.sm),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(l(uz: 'Bekor qilish', cy: 'Бекор қилиш', ru: 'Отмена', en: 'Cancel')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ] else if (_tab == 2) ...[
          CabinetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabinetCardTitle(l(uz: "Parolni o'zgartirish", cy: 'Паролни ўзгартириш', ru: 'Изменить пароль', en: 'Change password')),
                const SizedBox(height: AppSpace.md),
                AdaptiveGrid(
                  minCardWidth: 280,
                  maxColumns: 2,
                  children: [
                    _LabeledInput(l(uz: 'Joriy parol', cy: 'Жорий парол', ru: 'Текущий пароль', en: 'Current password'), const TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: '••••••••'))),
                    _LabeledInput(l(uz: 'Yangi parol', cy: 'Янги парол', ru: 'Новый пароль', en: 'New password'), const TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: '••••••••'))),
                    _LabeledInput(l(uz: 'Yangi parolni tasdiqlash', cy: 'Янги паролни тасдиқлаш', ru: 'Подтвердите новый пароль', en: 'Confirm new password'), const TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: '••••••••'))),
                  ],
                ),
                const SizedBox(height: AppSpace.md),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const PhosphorIcon(PhosphorIconsRegular.lockKey),
                  label: Text(l(uz: 'Parolni yangilash', cy: 'Паролни янгилаш', ru: 'Обновить пароль', en: 'Update password')),
                ),
              ],
            ),
          ),
        ] else ...[
          AdaptiveGrid(
            minCardWidth: 360,
            maxColumns: 2,
            children: [
              _FaqPanel(),
              _YordamSidePanel(),
            ],
          ),
        ],
      ],
    );
  }
}

// ─── Settings nav item ────────────────────────────────────────────────────────

class _SettingsNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool active;
  const _SettingsNavItem(this.icon, this.text, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.md),
      decoration: BoxDecoration(
        color: active ? AppTokens.primaryDark : AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: active ? AppTokens.primaryDark : AppTokens.border),
        boxShadow: active ? AppTokens.cardShadows : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(icon, size: 18, color: active ? Colors.white : AppTokens.textMuted),
          const SizedBox(width: AppSpace.sm),
          Text(text, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: active ? Colors.white : AppTokens.text)),
        ],
      ),
    );
  }
}

// ─── Yordam tab ───────────────────────────────────────────────────────────────

class _FaqPanel extends StatelessWidget {
  const _FaqPanel();

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    final faqs = [
      (
        l(uz: "A'zolik arizasi qancha vaqt ko'rib chiqiladi?", cy: 'Аъзолик аризаси қанча вақт кўриб чиқилади?', ru: 'Сколько рассматривается заявка на членство?', en: 'How long does membership review take?'),
        l(uz: "Ariza odatda 10-15 ish kuni ichida ko'rib chiqiladi.", cy: 'Ариза одатда 10-15 иш куни ичида кўриб чиқилади.', ru: 'Обычно заявка рассматривается за 10-15 рабочих дней.', en: 'Applications are usually reviewed within 10-15 business days.'),
      ),
      (
        l(uz: 'Qanday hujjatlar talab qilinadi?', cy: 'Қандай ҳужжатлар талаб қилинади?', ru: 'Какие документы требуются?', en: 'Which documents are required?'),
        l(uz: 'NGO Ustavi, guvohnoma, rahbar malumotnomasi, soliq malumotnomasi talab qilinadi.', cy: 'НГО Устави, гувоҳнома, раҳбар маълумотномаси, солиқ маълумотномаси талаб қилинади.', ru: 'Требуются устав НКО, свидетельство, данные руководителя и налоговая справка.', en: 'NGO charter, certificate, leader details, and tax reference are required.'),
      ),
      (
        l(uz: 'Hujjat qaytarilsa nima qilish kerak?', cy: 'Ҳужжат қайтарилса нима қилиш керак?', ru: 'Что делать, если документ отклонили?', en: 'What if a document is returned?'),
        l(uz: 'Admin izohiga asosan tuzatib qayta yuklash kerak.', cy: 'Админ изоҳига асосан тузатиб қайта юклаш керак.', ru: 'Исправьте по комментарию администратора и загрузите повторно.', en: 'Fix according to admin comments and upload again.'),
      ),
      (
        l(uz: 'Shartnoma qanday imzolanadi?', cy: 'Шартнома қандай имзоланади?', ru: 'Как подписывается договор?', en: 'How is the contract signed?'),
        l(uz: 'Shartnoma kabinet ichida elektron korinishda imzolanadi.', cy: 'Шартнома кабинет ичида электрон кўринишда имзоланади.', ru: 'Договор подписывается в электронном виде в личном кабинете.', en: 'The contract is signed electronically within the cabinet.'),
      ),
      (
        l(uz: 'Parolni unutsam nima qilaman?', cy: 'Паролни унутсам нима қиламан?', ru: 'Что делать, если забыл пароль?', en: 'What if I forgot my password?'),
        l(uz: "Kirish sahifasida 'Parolni unutdim' havolasidan foydalaning.", cy: "Кириш саҳифасида 'Паролни унутдим' ҳаволасидан фойдаланинг.", ru: "Используйте ссылку 'Забыли пароль?' на странице входа.", en: "Use the 'Forgot password' link on the login page."),
      ),
    ];

    return CabinetCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CabinetCardTitle(l(uz: "Ko'p so'raladigan savollar", cy: 'Кўп сўраладиган саволлар', ru: 'Часто задаваемые вопросы', en: 'Frequently asked questions')),
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

class _YordamSidePanel extends StatelessWidget {
  const _YordamSidePanel();

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
        const SizedBox(height: AppSpace.md),
        CabinetCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CabinetCardTitle(l(uz: 'Aloqa', cy: 'Алоқа', ru: 'Связь', en: 'Contact us')),
              const SizedBox(height: AppSpace.md),
              ContactCards(
                left: InfoCard(
                  title: l(uz: 'Aloqa malumotlari', cy: 'Алоқа маълумотлари', ru: 'Контактные данные', en: 'Contact details'),
                  description: l(
                    uz: 'Telefon: (+998 55) 503-05-12\nEmail: info@nntma.uz\nManzil: Furqat kochasi 1A, Toshkent',
                    cy: 'Телефон: (+998 55) 503-05-12\nEmail: info@nntma.uz\nМанзил: Фурқат кўчаси 1A, Тошкент',
                    ru: 'Телефон: (+998 55) 503-05-12\nEmail: info@nntma.uz\nАдрес: ул. Фурката 1A, Ташкент',
                    en: 'Phone: (+998 55) 503-05-12\nEmail: info@nntma.uz\nAddress: Furqat street 1A, Tashkent',
                  ),
                ),
                right: ContactForm(),
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

// ─── Shared ───────────────────────────────────────────────────────────────────

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
