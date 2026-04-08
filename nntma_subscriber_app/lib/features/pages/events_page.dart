import 'package:flutter/material.dart';

import '../../core/app_i18n.dart';
import '../../core/app_language.dart';
import '../../core/async_list_controller.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/adaptive_grid.dart';
import '../../widgets/async_card_section.dart';
import '../../widgets/cards.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late final AsyncListController<CardData> _controller;

  @override
  void initState() {
    super.initState();
    _controller = AsyncListController<CardData>(loader: contentRepository.fetchEventCards)..load();
    appLanguageController.addListener(_onLanguageChanged);
  }

  void _onLanguageChanged() {
    _controller.load();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    appLanguageController.removeListener(_onLanguageChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String l({required String uz, required String cy, required String ru, required String en}) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return PageScaffold(
      heroTitle: l(uz: 'Tadbirlar', cy: 'Тадбирлар', ru: 'События', en: 'Events'),
      heroSub: l(
        uz: "Seminar, trening va ochiq muloqot uchrashuvlari jadvali.",
        cy: 'Семинар, тренинг ва очиқ мулоқот учрашувлари жадвали.',
        ru: 'Расписание семинаров, тренингов и открытых встреч.',
        en: 'Schedule of seminars, trainings, and open dialogue sessions.',
      ),
      children: [
        ResponsiveSection(
          title: l(uz: 'Yaqin tadbirlar', cy: 'Яқин тадбирлар', ru: 'Ближайшие события', en: 'Upcoming events'),
          child: AsyncCardSection(controller: _controller),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Asosiy forum va anjumanlar', cy: 'Асосий форум ва анжуманлар', ru: 'Основные форумы и конференции', en: 'Major forums and conferences'),
          subtitle: l(
            uz: 'Yil davomidagi yirik tadbirlar kesimi.',
            cy: 'Йил давомидаги йирик тадбирлар кесими.',
            ru: 'Крупные события в течение года.',
            en: 'Major events throughout the year.',
          ),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(
                badge: l(uz: 'Ochiq', cy: 'Очиқ', ru: 'Открыто', en: 'Open'),
                title: l(uz: 'NNTlar uchun ijtimoiy sheriklik forumi', cy: 'ННТлар учун ижтимоий шериклик форуми', ru: 'Форум социального партнерства для ННО', en: 'Social partnership forum for NGOs'),
                description: l(
                  uz: "May 2026 - Toshkent - davlat idoralari va NNTlar ishtirokidagi ochiq muloqot.",
                  cy: 'Май 2026 - Тошкент - давлат идоралари ва ННТлар иштирокидаги очиқ мулоқот.',
                  ru: 'Май 2026, Ташкент - открытый диалог с участием госорганов и ННО.',
                  en: 'May 2026, Tashkent - open dialogue with public institutions and NGOs.',
                ),
              ),
              InfoCard(
                badge: l(uz: 'Ochiq', cy: 'Очиқ', ru: 'Открыто', en: 'Open'),
                title: l(uz: 'Hududiy rivojlanish konferensiyasi', cy: 'Ҳудудий ривожланиш конференцияси', ru: 'Конференция регионального развития', en: 'Regional development conference'),
                description: l(
                  uz: 'Iyun 2026 - Samarqand - hududiy tashabbuslar va amaliy natijalar muhokamasi.',
                  cy: 'Июн 2026 - Самарқанд - ҳудудий ташаббуслар ва амалий натижалар муҳокамаси.',
                  ru: 'Июнь 2026, Самарканд - обсуждение региональных инициатив и практических результатов.',
                  en: 'June 2026, Samarkand - discussion of regional initiatives and practical outcomes.',
                ),
              ),
              InfoCard(
                badge: l(uz: 'Rejada', cy: 'Режада', ru: 'План', en: 'Planned'),
                title: l(uz: 'NNTlar uchun raqamli imkoniyatlar forumi', cy: 'ННТлар учун рақамли имкониятлар форуми', ru: 'Форум цифровых возможностей для ННО', en: 'Digital opportunities forum for NGOs'),
                description: l(
                  uz: 'Iyul 2026 - Toshkent - raqamli platformalar va avtomatlashtirish yechimlari.',
                  cy: 'Июл 2026 - Тошкент - рақамли платформалар ва автоматлаштириш ечимлари.',
                  ru: 'Июль 2026, Ташкент - цифровые платформы и решения автоматизации.',
                  en: 'July 2026, Tashkent - digital platforms and automation solutions.',
                ),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          title: l(uz: 'Workshop va seminarlar', cy: 'Воркшоп ва семинарлар', ru: 'Воркшопы и семинары', en: 'Workshops and seminars'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(
                badge: l(uz: 'Ochiq', cy: 'Очиқ', ru: 'Открыто', en: 'Open'),
                title: l(uz: "Grant arizasini to'g'ri tayyorlash workshopi", cy: 'Грант аризасини тўғри тайёрлаш воркшопи', ru: 'Воркшоп по правильной подготовке грантовой заявки', en: 'Workshop on preparing grant applications correctly'),
                description: l(
                  uz: "Amaliy keyslar asosida bosqichma-bosqich ishlash formati.",
                  cy: 'Амалий кейслар асосида босқичма-босқич ишлаш формати.',
                  ru: 'Пошаговый формат на основе практических кейсов.',
                  en: 'Step-by-step format based on practical cases.',
                ),
              ),
              InfoCard(
                badge: l(uz: 'Ochiq', cy: 'Очиқ', ru: 'Открыто', en: 'Open'),
                title: l(uz: 'Hisobot topshirish va auditga tayyorgarlik seminari', cy: 'Ҳисобот топшириш ва аудитга тайёргарлик семинари', ru: 'Семинар по отчетности и подготовке к аудиту', en: 'Seminar on reporting and audit readiness'),
                description: l(
                  uz: "Hisobot sifati va tekshiruvlarga tayyorgarlik bo'yicha amaliy tavsiyalar.",
                  cy: 'Ҳисобот сифати ва текширувларга тайёргарлик бўйича амалий тавсиялар.',
                  ru: 'Практические рекомендации по качеству отчетов и подготовке к проверкам.',
                  en: 'Practical recommendations for report quality and audit preparedness.',
                ),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Alohida dasturlar', cy: 'Алоҳида дастурлар', ru: 'Специальные программы', en: 'Special programs'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(
                badge: l(uz: 'Maxsus', cy: 'Махсус', ru: 'Спец', en: 'Special'),
                title: l(uz: 'Yoshlar tashabbuslari haftaligi', cy: 'Ёшлар ташаббуслари ҳафталиги', ru: 'Неделя молодежных инициатив', en: 'Youth initiatives week'),
                description: l(
                  uz: 'Yoshlar NNTlari uchun taqdimotlar va mentorlik sessiyalari.',
                  cy: 'Ёшлар ННТлари учун тақдимотлар ва менторлик сессиялари.',
                  ru: 'Презентации и менторские сессии для молодежных ННО.',
                  en: 'Presentations and mentoring sessions for youth NGOs.',
                ),
              ),
              InfoCard(
                badge: l(uz: 'Maxsus', cy: 'Махсус', ru: 'Спец', en: 'Special'),
                title: l(uz: 'Ayollar NNTlari liderlik uchrashuvi', cy: 'Аёллар ННТлари лидерлик учрашуви', ru: 'Лидерская встреча женских ННО', en: 'Women NGOs leadership meetup'),
                description: l(
                  uz: 'Hududlar kesimida tajriba almashish va hamkorlik maydoni.',
                  cy: 'Ҳудудлар кесимида тажриба алмашиш ва ҳамкорлик майдони.',
                  ru: 'Площадка обмена опытом и сотрудничества между регионами.',
                  en: 'A space for cross-regional experience sharing and collaboration.',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
