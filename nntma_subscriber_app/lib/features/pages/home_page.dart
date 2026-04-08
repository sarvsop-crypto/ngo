import 'package:flutter/material.dart';

import '../../core/app_i18n.dart';
import '../../core/app_language.dart';
import '../../core/async_list_controller.dart';
import '../../core/load_state.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/adaptive_grid.dart';
import '../../widgets/async_card_section.dart';
import '../../widgets/cards.dart';
import '../../widgets/contact_form.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/gov_portal_section.dart';
import '../../widgets/responsive_section.dart';
import '../../widgets/state_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AsyncListController<KpiData> _kpiController;
  late final AsyncListController<CardData> _newsController;
  late final AsyncListController<CardData> _eventsController;
  late final AsyncListController<CardData> _aboutController;
  late final AsyncListController<CardData> _servicesController;

  @override
  void initState() {
    super.initState();
    _kpiController = AsyncListController<KpiData>(loader: contentRepository.fetchKpis)..load();
    _newsController = AsyncListController<CardData>(loader: contentRepository.fetchHomeNews)..load();
    _eventsController = AsyncListController<CardData>(loader: contentRepository.fetchEventCards)..load();
    _aboutController = AsyncListController<CardData>(loader: contentRepository.fetchAboutCards)..load();
    _servicesController = AsyncListController<CardData>(loader: contentRepository.fetchServiceCards)..load();
    appLanguageController.addListener(_onLanguageChanged);
  }

  void _onLanguageChanged() {
    _kpiController.load();
    _newsController.load();
    _eventsController.load();
    _aboutController.load();
    _servicesController.load();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    appLanguageController.removeListener(_onLanguageChanged);
    _kpiController.dispose();
    _newsController.dispose();
    _eventsController.dispose();
    _aboutController.dispose();
    _servicesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = context.i18n;
    final viewMoreLabel = i18n.pick(
      uzLatin: 'Batafsil',
      uzCyrillic: 'Батафсил',
      russian: 'Подробнее',
      english: 'View all',
    );
    return PageScaffold(
      heroTitle: context.i18n.t('home.title'),
      heroSub: context.i18n.t('home.sub'),
      children: [
        GovPortalSection(
          title: i18n.pick(
            uzLatin: "Hayotiy vaziyatlar",
            uzCyrillic: "Ҳаётий вазиятлар",
            russian: "Жизненные ситуации",
            english: "Life situations",
          ),
          subtitle: i18n.pick(
            uzLatin: "Aholi tezkor javob kutadigan eng muhim savollar.",
            uzCyrillic: "Аҳоли тезкор жавоб кутадиган энг муҳим саволлар.",
            russian: "Самые важные вопросы, на которые граждане ждут быстрых ответов.",
            english: "Key questions citizens expect swift answers to.",
          ),
          items: _lifeSituationItems,
          actionLabel: viewMoreLabel,
        ),
        GovPortalSection(
          title: i18n.pick(
            uzLatin: "Davlat xizmatlari",
            uzCyrillic: "Давлат хизматлари",
            russian: "Госуслуги",
            english: "State services",
          ),
          subtitle: i18n.pick(
            uzLatin: "Elektron hujjat, murojaat va grant imkoniyatlari.",
            uzCyrillic: "Электрон ҳужжат, мурожаат ва грант имкониятлари.",
            russian: "Электронные документы, обращения и грантовые возможности.",
            english: "Digital documents, requests and grant opportunities.",
          ),
          items: _serviceItems,
          actionLabel: viewMoreLabel,
        ),
        GovPortalSection(
          title: i18n.pick(
            uzLatin: "O‘zbekiston bo‘limlari",
            uzCyrillic: "Ўзбекистон бўлимлари",
            russian: "Разделы Узбекистана",
            english: "Uzbekistan sections",
          ),
          subtitle: i18n.pick(
            uzLatin: "Madaniyat, ta'lim va hududiy yangiliklar.",
            uzCyrillic: "Маданият, таълим ва ҳудудий янгиликлар.",
            russian: "Культура, образование и региональные новости.",
            english: "Culture, education and regional updates.",
          ),
          items: _countryItems,
        ),
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: 'Asosiy korsatkichlar',
            uzCyrillic: 'Асосий кўрсаткичлар',
            russian: 'Ключевые показатели',
            english: 'Key indicators',
          ),
          subtitle: context.i18n.pick(
            uzLatin: 'Tashkilot faoliyatining qisqa statistik korinishi.',
            uzCyrillic: 'Ташкилот фаолиятининг қисқа статистик кўриниши.',
            russian: 'Краткая статистика деятельности организации.',
            english: 'A quick statistical snapshot of organization activity.',
          ),
          child: _KpiGrid(controller: _kpiController),
        ),
        ResponsiveSection(
          light: false,
          title: context.i18n.t('nav.news'),
          child: AsyncCardSection(controller: _newsController),
        ),
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: 'Yaqin tadbirlar',
            uzCyrillic: 'Яқин тадбирлар',
            russian: 'Ближайшие события',
            english: 'Upcoming events',
          ),
          subtitle: context.i18n.pick(
            uzLatin: 'Seminar, forum va treninglar taqvimi.',
            uzCyrillic: 'Семинар, форум ва тренинглар тақвими.',
            russian: 'Расписание семинаров, форумов и тренингов.',
            english: 'Calendar of seminars, forums and trainings.',
          ),
          child: AsyncCardSection(controller: _eventsController),
        ),
        ResponsiveSection(
          title: context.i18n.t('about.title'),
          subtitle: context.i18n.t('about.sub'),
          child: AsyncCardSection(controller: _aboutController),
        ),
        ResponsiveSection(
          light: false,
          title: context.i18n.t('services.title'),
          subtitle: context.i18n.t('services.sub'),
          child: AsyncCardSection(controller: _servicesController),
        ),
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: 'Asosiy loyihalar',
            uzCyrillic: 'Асосий лойиҳалар',
            russian: 'Ключевые проекты',
            english: 'Key projects',
          ),
          subtitle: context.i18n.pick(
            uzLatin: 'NNT sektorini rivojlantirishga qaratilgan ustuvor tashabbuslar.',
            uzCyrillic: 'ННТ сектори ривожига қаратилган устувор ташаббуслар.',
            russian: 'Приоритетные инициативы по развитию сектора ННО.',
            english: 'Priority initiatives focused on NGO sector development.',
          ),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 3,
            spacing: 10,
            children: [
              InfoCard(
                badge: context.i18n.pick(uzLatin: 'Jarayonda', uzCyrillic: 'Жараёнда', russian: 'В процессе', english: 'In progress'),
                title: context.i18n.pick(
                  uzLatin: 'NNT salohiyatini oshirish dasturi',
                  uzCyrillic: 'ННТ салоҳиятини ошириш дастури',
                  russian: 'Программа развития потенциала ННО',
                  english: 'NGO capacity development program',
                ),
                description: context.i18n.pick(
                  uzLatin: "Loyiha boshqaruvi, hisobot va grant yozish bo'yicha amaliy o'quv modullari.",
                  uzCyrillic: 'Лойиҳа бошқаруви, ҳисобот ва грант ёзиш бўйича амалий ўқув модуллари.',
                  russian: 'Практические учебные модули по управлению проектами, отчетности и написанию грантов.',
                  english: 'Practical training modules on project management, reporting, and grant writing.',
                ),
              ),
              InfoCard(
                badge: context.i18n.pick(uzLatin: 'Yakunlangan', uzCyrillic: 'Якунланган', russian: 'Завершено', english: 'Completed'),
                title: context.i18n.pick(
                  uzLatin: "Hududiy konsultatsiya tarmog'i",
                  uzCyrillic: 'Ҳудудий консультация тармоғи',
                  russian: 'Региональная сеть консультаций',
                  english: 'Regional consultation network',
                ),
                description: context.i18n.pick(
                  uzLatin: "Viloyatlarda NNTlar uchun huquqiy va tashkiliy maslahat xizmatlari kengaytirildi.",
                  uzCyrillic: 'Вилоятларда ННТлар учун ҳуқуқий ва ташкилий маслаҳат хизматлари кенгайтирилди.',
                  russian: 'Расширены юридические и организационные консультации для ННО в регионах.',
                  english: 'Legal and organizational advisory support for NGOs was expanded in regions.',
                ),
              ),
              InfoCard(
                badge: context.i18n.pick(uzLatin: 'Rejada', uzCyrillic: 'Режада', russian: 'План', english: 'Planned'),
                title: context.i18n.pick(
                  uzLatin: 'Raqamli monitoring platformasi',
                  uzCyrillic: 'Рақамли мониторинг платформаси',
                  russian: 'Платформа цифрового мониторинга',
                  english: 'Digital monitoring platform',
                ),
                description: context.i18n.pick(
                  uzLatin: "A'zolik, hujjatlar va hisobotlar holatini bir oynada kuzatish imkoniyati.",
                  uzCyrillic: 'Аъзолик, ҳужжатлар ва ҳисоботлар ҳолатини бир ойнада кузатиш имконияти.',
                  russian: 'Отслеживание членства, документов и отчетов в одном интерфейсе.',
                  english: 'Track membership, documents, and reports in a single dashboard.',
                ),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          light: false,
          title: context.i18n.pick(
            uzLatin: "Yutuqlar va e'tiroflar",
            uzCyrillic: 'Ютуқлар ва эътирофлар',
            russian: 'Достижения и признание',
            english: 'Achievements and recognition',
          ),
          subtitle: context.i18n.pick(
            uzLatin: "Assotsiatsiya va a'zolar faoliyati bo'yicha asosiy e'tirof yo'nalishlari.",
            uzCyrillic: 'Ассоциация ва аъзолар фаолияти бўйича асосий эътироф йўналишлари.',
            russian: 'Ключевые направления признания деятельности ассоциации и ее членов.',
            english: 'Key recognition areas for association and member activities.',
          ),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 3,
            spacing: 10,
            children: [
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: 'Yilning eng faol NNT tashabbusi',
                  uzCyrillic: 'Йилнинг энг фаол ННТ ташаббуси',
                  russian: 'Самая активная ННО-инициатива года',
                  english: 'Most active NGO initiative of the year',
                ),
                description: context.i18n.pick(
                  uzLatin: "Ijtimoiy ta'sir ko'rsatkichlari yuqori bo'lgan loyihalar e'tirofi.",
                  uzCyrillic: 'Ижтимоий таъсир кўрсаткичлари юқори бўлган лойиҳалар эътирофи.',
                  russian: 'Признание проектов с высоким социальным эффектом.',
                  english: 'Recognition of projects with strong social impact.',
                ),
              ),
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: 'Hududiy hamkorlik mukofoti',
                  uzCyrillic: 'Ҳудудий ҳамкорлик мукофоти',
                  russian: 'Премия регионального партнерства',
                  english: 'Regional partnership award',
                ),
                description: context.i18n.pick(
                  uzLatin: "Mahalliy idoralar va NNTlar o'rtasidagi samarali sheriklik uchun e'tirof.",
                  uzCyrillic: 'Маҳаллий идоралар ва ННТлар ўртасидаги самарали шериклик учун эътироф.',
                  russian: 'Признание эффективного взаимодействия между местными органами и ННО.',
                  english: 'Recognition for effective cooperation between local authorities and NGOs.',
                ),
              ),
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: "Raqamli tashabbus yutug'i",
                  uzCyrillic: 'Рақамли ташаббус ютуғи',
                  russian: 'Награда за цифровую инициативу',
                  english: 'Digital initiative award',
                ),
                description: context.i18n.pick(
                  uzLatin: "Raqamli yechimlar orqali fuqarolarga qulaylik yaratgan loyihalar e'tirofi.",
                  uzCyrillic: 'Рақамли ечимлар орқали фуқароларга қулайлик яратган лойиҳалар эътирофи.',
                  russian: 'Признание проектов, улучшивших удобство для граждан с помощью цифровых решений.',
                  english: 'Recognition for projects improving citizen experience through digital solutions.',
                ),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: "A'zolikdagi NNTlar (siz to'ldirasiz)",
            uzCyrillic: 'Аъзоликдаги ННТлар (сиз тўлдирасиз)',
            russian: 'ННО в составе членства (заполняете вы)',
            english: 'Member NGOs (to be filled by you)',
          ),
          subtitle: context.i18n.pick(
            uzLatin: "Ushbu bo'limga assotsiatsiyaga a'zo tashkilotlar ro'yxati va logotiplari siz tomondan kiritiladi.",
            uzCyrillic: 'Ушбу бўлимга ассоциацияга аъзо ташкилотлар рўйхати ва логотиплари сиз томондан киритилади.',
            russian: 'В этом разделе вы добавите список и логотипы организаций-членов ассоциации.',
            english: 'You can fill this section with the list and logos of member organizations.',
          ),
          child: AdaptiveGrid(
            minCardWidth: 150,
            maxColumns: 4,
            spacing: 10,
            children: [
              InfoCard(title: 'NNT 1', description: context.i18n.pick(uzLatin: "Tashkilot nomi va qisqa yo'nalishi (to'ldiriladi)", uzCyrillic: 'Ташкилот номи ва қисқа йўналиши (тўлдирилади)', russian: 'Название организации и короткое направление (заполняется)', english: 'Organization name and short focus area (to be filled)')),
              InfoCard(title: 'NNT 2', description: context.i18n.pick(uzLatin: "Tashkilot nomi va qisqa yo'nalishi (to'ldiriladi)", uzCyrillic: 'Ташкилот номи ва қисқа йўналиши (тўлдирилади)', russian: 'Название организации и короткое направление (заполняется)', english: 'Organization name and short focus area (to be filled)')),
              InfoCard(title: 'NNT 3', description: context.i18n.pick(uzLatin: "Tashkilot nomi va qisqa yo'nalishi (to'ldiriladi)", uzCyrillic: 'Ташкилот номи ва қисқа йўналиши (тўлдирилади)', russian: 'Название организации и короткое направление (заполняется)', english: 'Organization name and short focus area (to be filled)')),
              InfoCard(title: 'NNT 4', description: context.i18n.pick(uzLatin: "Tashkilot nomi va qisqa yo'nalishi (to'ldiriladi)", uzCyrillic: 'Ташкилот номи ва қисқа йўналиши (тўлдирилади)', russian: 'Название организации и короткое направление (заполняется)', english: 'Organization name and short focus area (to be filled)')),
            ],
          ),
        ),
        ResponsiveSection(
          title: context.i18n.t('contact.title'),
          subtitle: context.i18n.t('contact.sub'),
          child: ContactCards(
            left: InfoCard(
              title: context.i18n.pick(
                uzLatin: "Aloqa ma'lumotlari",
                uzCyrillic: 'Алоқа маълумотлари',
                russian: 'Контактная информация',
                english: 'Contact information',
              ),
              description: context.i18n.pick(
                uzLatin: "Telefon: (+998 55) 503-05-12\nEmail: info@ngo.uz\nManzil: Furqat ko'chasi 1A, Shayxontohur tumani, Toshkent",
                uzCyrillic: 'Телефон: (+998 55) 503-05-12\nEmail: info@ngo.uz\nМанзил: Фурқат кўчаси 1A, Шайхонтоҳур тумани, Тошкент',
                russian: 'Телефон: (+998 55) 503-05-12\nEmail: info@ngo.uz\nАдрес: ул. Фурката 1A, Шайхантахурский район, Ташкент',
                english: 'Phone: (+998 55) 503-05-12\nEmail: info@ngo.uz\nAddress: 1A Furqat street, Shaykhontohur district, Tashkent',
              ),
            ),
            right: const ContactForm(),
          ),
        ),
      ],
    );
  }
}

class _KpiGrid extends StatelessWidget {
  final AsyncListController<KpiData> controller;

  const _KpiGrid({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final state = controller.state == LoadState.idle ? LoadState.loading : controller.state;
        return SectionStateView(
          state: state,
          onRetry: controller.load,
          readyChild: AdaptiveGrid(
            minCardWidth: 150,
            maxColumns: 4,
            spacing: 10,
            children: [
              for (final item in controller.items)
                KpiCard(value: item.value, label: item.label, compact: true),
            ],
          ),
        );
      },
    );
  }
}

const _lifeSituationItems = [
  const LocalizedValue(
    uzLatin: "Hayotiy vaziyatlar bo‘yicha tez-tez beriladigan savollar",
    uzCyrillic: "Ҳаётий вазиятлар бўйича тез-тез бериладиган саволлар",
    russian: "Часто задаваемые вопросы о жизненных ситуациях",
    english: "Life situation FAQs",
  ),
  const LocalizedValue(
    uzLatin: "Davlat xizmatlari",
    uzCyrillic: "Давлат хизматлари",
    russian: "Госуслуги",
    english: "Public services",
  ),
  const LocalizedValue(
    uzLatin: "Voqealar taqvimi",
    uzCyrillic: "Воқеалар тақвими",
    russian: "Календарь событий",
    english: "Events calendar",
  ),
  const LocalizedValue(
    uzLatin: "Hujjatlar",
    uzCyrillic: "Ҳужжатлар",
    russian: "Документы",
    english: "Documents",
  ),
  const LocalizedValue(
    uzLatin: "Foydali havolalar",
    uzCyrillic: "Фойдали ҳаволалар",
    russian: "Полезные ссылки",
    english: "Useful links",
  ),
  const LocalizedValue(
    uzLatin: "Yangiliklar",
    uzCyrillic: "Янгиликлар",
    russian: "Новости",
    english: "News",
  ),
];

const _serviceItems = [
  const LocalizedValue(
    uzLatin: "Barcha xizmatlar",
    uzCyrillic: "Барча хизматлар",
    russian: "Все услуги",
    english: "All services",
  ),
  const LocalizedValue(
    uzLatin: "Elektron ishtirok",
    uzCyrillic: "Электрон иштирок",
    russian: "Электронное участие",
    english: "Electronic participation",
  ),
  const LocalizedValue(
    uzLatin: "Hujjatlarni izlash",
    uzCyrillic: "Ҳужжатларни излаш",
    russian: "Поиск документов",
    english: "Document search",
  ),
  const LocalizedValue(
    uzLatin: "Murojaat yozish",
    uzCyrillic: "Мурожаат ёзиш",
    russian: "Подать обращение",
    english: "Submit request",
  ),
  const LocalizedValue(
    uzLatin: "Grantlar",
    uzCyrillic: "Грантлар",
    russian: "Гранты",
    english: "Grants",
  ),
  const LocalizedValue(
    uzLatin: "Ta'lim va treninglar",
    uzCyrillic: "Таълим ва тренинглар",
    russian: "Образование и тренинги",
    english: "Education and trainings",
  ),
  const LocalizedValue(
    uzLatin: "Hududiy sheriklik",
    uzCyrillic: "Ҳудудий шериклик",
    russian: "Региональное партнёрство",
    english: "Regional partnerships",
  ),
];

const _countryItems = [
  const LocalizedValue(
    uzLatin: "Turizm",
    uzCyrillic: "Туризм",
    russian: "Туризм",
    english: "Tourism",
  ),
  const LocalizedValue(
    uzLatin: "Madaniyat",
    uzCyrillic: "Маданият",
    russian: "Культура",
    english: "Culture",
  ),
  const LocalizedValue(
    uzLatin: "Umumiy ma'lumot",
    uzCyrillic: "Умумий маълумот",
    russian: "Общая информация",
    english: "General info",
  ),
  const LocalizedValue(
    uzLatin: "Ta'lim",
    uzCyrillic: "Таълим",
    russian: "Образование",
    english: "Education",
  ),
  const LocalizedValue(
    uzLatin: "Elektron ishtirok",
    uzCyrillic: "Электрон иштирок",
    russian: "Электронное участие",
    english: "E-participation",
  ),
  const LocalizedValue(
    uzLatin: "Hududlar",
    uzCyrillic: "Ҳудудлар",
    russian: "Регионы",
    english: "Regions",
  ),
];
