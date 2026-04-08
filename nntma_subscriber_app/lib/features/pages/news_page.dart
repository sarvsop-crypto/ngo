import 'package:flutter/material.dart';

import '../../core/app_i18n.dart';
import '../../core/app_tokens.dart';
import '../../widgets/adaptive_grid.dart';
import '../../widgets/cards.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return PageScaffold(
      heroTitle: context.i18n.t('news.title'),
      heroSub: context.i18n.t('news.sub'),
      children: [
        ResponsiveSection(
          title: _tab == 0
              ? l(uz: "So'nggi e'lonlar", cy: 'Сўнгги эълонлар', ru: 'Последние объявления', en: 'Latest announcements')
              : l(uz: 'Yaqin tadbirlar', cy: 'Яқин тадбирлар', ru: 'Ближайшие события', en: 'Upcoming events'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TabRow(active: _tab, onSelect: (i) => setState(() => _tab = i)),
              const SizedBox(height: AppSpace.md),
              if (_tab == 0)
                AdaptiveGrid(
                  minCardWidth: 240,
                  maxColumns: 2,
                  children: [
                    InfoCard(
                      badge: l(uz: 'Yangilik', cy: 'Янгилик', ru: 'Новость', en: 'News'),
                      title: l(uz: "NNTlar haftaligi dasturi e'lon qilindi", cy: 'ННТлар ҳафталиги дастури эълон қилинди', ru: 'Опубликована программа недели ННО', en: 'NGO week program announced'),
                      description: l(uz: 'Haftalik doirasida forum, seminar va ochiq muloqot tadbirlari rejalashtirildi.', cy: 'Ҳафталик доирасида форум, семинар ва очиқ мулоқот тадбирлари режалаштирилди.', ru: 'В рамках недели запланированы форумы, семинары и открытые обсуждения.', en: 'Forums, seminars, and open dialogue events are planned for the week.'),
                    ),
                    InfoCard(
                      badge: l(uz: "E'lon", cy: 'Эълон', ru: 'Объявление', en: 'Announcement'),
                      title: l(uz: "Grant hujjatlari bo'yicha bepul konsultatsiya", cy: 'Грант ҳужжатлари бўйича бепул консультация', ru: 'Бесплатная консультация по грантовым документам', en: 'Free consultation on grant documents'),
                      description: l(uz: "Hududiy bo'limlarda loyiha hujjatlarini tayyorlash bo'yicha amaliy qabul kunlari boshlandi.", cy: 'Ҳудудий бўлимларда лойиҳа ҳужжатларини тайёрлаш бўйича амалий қабул кунлари бошланди.', ru: 'В региональных отделениях начались практические приемы по подготовке проектной документации.', en: 'Regional offices started practical support days for preparing project documents.'),
                    ),
                    InfoCard(
                      badge: l(uz: 'Yangilik', cy: 'Янгилик', ru: 'Новость', en: 'News'),
                      title: l(uz: 'NNTlar uchun raqamli platforma imkoniyatlari kengaydi', cy: 'ННТлар учун рақамли платформа имкониятлари кенгайди', ru: 'Расширены возможности цифровой платформы для ННО', en: 'Digital platform features for NGOs expanded'),
                      description: l(uz: "Ariza va hujjatlar holatini kuzatish uchun yangi funksiyalar qo'shildi.", cy: 'Ариза ва ҳужжатлар ҳолатини кузатиш учун янги функциялар қўшилди.', ru: 'Добавлены новые функции для отслеживания статуса заявок и документов.', en: 'New functions were added to track application and document status.'),
                    ),
                  ],
                )
              else
                AdaptiveGrid(
                  minCardWidth: 240,
                  maxColumns: 2,
                  children: [
                    InfoCard(
                      badge: l(uz: 'Tadbir', cy: 'Тадбир', ru: 'Событие', en: 'Event'),
                      title: l(uz: 'Toshkent: Grant yozish seminari', cy: 'Тошкент: Грант ёзиш семинари', ru: 'Ташкент: семинар по написанию грантов', en: 'Tashkent: grant writing seminar'),
                      description: l(uz: '24-aprel, 10:00-13:00, O‘zNNTMA markaziy ofisi.', cy: '24-апрел, 10:00-13:00, ЎзННТМА марказий офиси.', ru: '24 апреля, 10:00-13:00, центральный офис OʻzNNTMA.', en: 'April 24, 10:00-13:00, OʻzNNTMA central office.'),
                    ),
                    InfoCard(
                      badge: l(uz: 'Tadbir', cy: 'Тадбир', ru: 'Событие', en: 'Event'),
                      title: l(uz: 'Samarqand: Loyiha boshqaruvi treningi', cy: 'Самарқанд: Лойиҳа бошқаруви тренинги', ru: 'Самарканд: тренинг по управлению проектами', en: 'Samarkand: project management training'),
                      description: l(uz: "30-aprel, 14:00-17:00, hududiy bo'linma ofisi.", cy: '30-апрел, 14:00-17:00, ҳудудий бўлинма офиси.', ru: '30 апреля, 14:00-17:00, офис регионального отделения.', en: 'April 30, 14:00-17:00, regional branch office.'),
                    ),
                    InfoCard(
                      badge: l(uz: 'Tadbir', cy: 'Тадбир', ru: 'Событие', en: 'Event'),
                      title: l(uz: 'Andijon: Jamoatchilik nazorati muloqoti', cy: 'Андижон: Жамоатчилик назорати мулоқоти', ru: 'Андижан: диалог по общественному контролю', en: 'Andijan: public oversight dialogue'),
                      description: l(uz: '6-may, 11:00-13:30, NNTlar uyi.', cy: '6-май, 11:00-13:30, ННТлар уйи.', ru: '6 мая, 11:00-13:30, Дом ННО.', en: 'May 6, 11:00-13:30, NGO House.'),
                    ),
                  ],
                ),
            ],
          ),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Media markaz', cy: 'Медиа марказ', ru: 'Медиа-центр', en: 'Media center'),
          subtitle: l(uz: 'Press-reliz, intervyu va mavzuli materiallar to‘plami.', cy: 'Пресс-релиз, интервью ва мавзули материаллар тўплами.', ru: 'Подборка пресс-релизов, интервью и тематических материалов.', en: 'Collection of press releases, interviews, and thematic materials.'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(
                badge: l(uz: 'Press reliz', cy: 'Пресс релиз', ru: 'Пресс-релиз', en: 'Press release'),
                title: l(uz: "NNTlar haftaligi bo'yicha rasmiy bayonot", cy: 'ННТлар ҳафталиги бўйича расмий баёнот', ru: 'Официальное заявление по неделе ННО', en: 'Official statement on NGO week'),
                description: l(uz: 'Haftalik doirasidagi tadbirlar, hamkorlar va asosiy natijalar yoritildi.', cy: 'Ҳафталик доирасидаги тадбирлар, ҳамкорлар ва асосий натижалар ёритилди.', ru: 'Освещены мероприятия недели, партнеры и ключевые результаты.', en: 'Highlights of weekly events, partners, and key outcomes.'),
              ),
              InfoCard(
                badge: l(uz: 'Intervyu', cy: 'Интервью', ru: 'Интервью', en: 'Interview'),
                title: l(uz: 'Hududiy bo‘linmalar faoliyati yuzasidan suhbat', cy: 'Ҳудудий бўлинмалар фаолияти юзасидан суҳбат', ru: 'Интервью о работе региональных отделений', en: 'Interview on regional branch operations'),
                description: l(uz: 'Viloyatlardagi konsultatsiya amaliyoti va yechimlar muhokama qilindi.', cy: 'Вилоятлардаги консультация амалиёти ва ечимлар муҳокама қилинди.', ru: 'Обсуждены региональная практика консультаций и решения.', en: 'Regional consultation practices and solutions were discussed.'),
              ),
              InfoCard(
                badge: l(uz: 'Tahlil', cy: 'Таҳлил', ru: 'Аналитика', en: 'Analysis'),
                title: l(uz: "NNTlar uchun grant ekotizimidagi o'zgarishlar", cy: 'ННТлар учун грант экотизимидаги ўзгаришлар', ru: 'Изменения в грантовой экосистеме для ННО', en: 'Changes in the NGO grant ecosystem'),
                description: l(uz: "Yangi tanlovlar, talablardagi o'zgarishlar va ariza topshirish tavsiyalari.", cy: 'Янги танловлар, талаблардаги ўзгаришлар ва ариза топшириш тавсиялари.', ru: 'Новые конкурсы, обновленные требования и рекомендации по подаче.', en: 'New calls, requirement updates, and application guidance.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabRow extends StatelessWidget {
  final int active;
  final ValueChanged<int> onSelect;
  const _TabRow({required this.active, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpace.sm,
      children: [
        _TabChip(
          context.i18n.pick(uzLatin: 'Yangiliklar', uzCyrillic: 'Янгиликлар', russian: 'Новости', english: 'News'),
          active == 0,
          () => onSelect(0),
        ),
        _TabChip(
          context.i18n.pick(uzLatin: 'Tadbirlar', uzCyrillic: 'Тадбирлар', russian: 'События', english: 'Events'),
          active == 1,
          () => onSelect(1),
        ),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _TabChip(this.label, this.active, this.onTap);

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
        child: Text(
          label,
          style: TextStyle(color: active ? Colors.white : AppTokens.text, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
