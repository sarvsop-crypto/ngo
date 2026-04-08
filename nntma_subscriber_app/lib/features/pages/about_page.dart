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

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late final AsyncListController<CardData> _controller;

  @override
  void initState() {
    super.initState();
    _controller = AsyncListController<CardData>(loader: contentRepository.fetchAboutCards)..load();
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
      heroTitle: context.i18n.t('about.title'),
      heroSub: context.i18n.t('about.sub'),
      children: [
        ResponsiveSection(
          title: l(uz: 'Ichki bo‘limlar', cy: 'Ички бўлимлар', ru: 'Внутренние разделы', en: 'Internal sections'),
          child: AsyncCardSection(controller: _controller),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Missiya va qadriyatlar', cy: 'Миссия ва қадриятлар', ru: 'Миссия и ценности', en: 'Mission and values'),
          subtitle: l(
            uz: "Assotsiatsiyaning strategik yo'nalishi va ish tamoyillari.",
            cy: 'Ассоциациянинг стратегик йўналиши ва иш тамойиллари.',
            ru: 'Стратегическое направление и принципы работы ассоциации.',
            en: 'Strategic direction and operating principles of the association.',
          ),
          child: InfoCard(
            title: l(
              uz: "Bizning missiya - NNTlar salohiyatini oshirish va fuqarolik jamiyatini mustahkamlash.",
              cy: 'Бизнинг миссия - ННТлар салоҳиятини ошириш ва фуқаролик жамиятини мустаҳкамлаш.',
              ru: 'Наша миссия - развивать потенциал ННО и укреплять гражданское общество.',
              en: 'Our mission is to develop NGO capacity and strengthen civil society.',
            ),
            description: l(
              uz: "Ochiqlik, sheriklik va mas'uliyat asosida NNTlar uchun qulay ekotizim yaratish.",
              cy: 'Очиқлик, шериклик ва масъулият асосида ННТлар учун қулай экотизим яратиш.',
              ru: 'Формировать благоприятную экосистему для ННО на основе открытости и партнерства.',
              en: 'Build an NGO-friendly ecosystem based on openness, partnership, and responsibility.',
            ),
          ),
        ),
        ResponsiveSection(
          title: l(uz: 'Asosiy tarixiy bosqichlar', cy: 'Асосий тарихий босқичлар', ru: 'Основные исторические этапы', en: 'Key milestones'),
          child: AdaptiveGrid(
            minCardWidth: 220,
            maxColumns: 2,
            children: [
              InfoCard(
                badge: '2026',
                title: l(uz: "Hududiy hamkorlikni kengaytirish", cy: 'Ҳудудий ҳамкорликни кенгайтириш', ru: 'Расширение регионального сотрудничества', en: 'Expansion of regional cooperation'),
                description: l(
                  uz: "Viloyat bo'linmalari orqali NNTlarga metodik va amaliy yordam ko'lami oshirildi.",
                  cy: 'Вилоят бўлинмалари орқали ННТларга методик ва амалий ёрдам кўлами оширилди.',
                  ru: 'Расширена методическая и практическая поддержка ННО через региональные подразделения.',
                  en: 'Methodological and practical support for NGOs expanded through regional branches.',
                ),
              ),
              InfoCard(
                badge: '2025',
                title: l(uz: 'Raqamli jarayonlarga o‘tish', cy: 'Рақамли жараёнларга ўтиш', ru: 'Переход к цифровым процессам', en: 'Transition to digital processes'),
                description: l(
                  uz: "A'zolik arizalari va hujjatlar aylanishining asosiy bosqichlari raqamlashtirildi.",
                  cy: 'Аъзолик аризалари ва ҳужжатлар айланишининг асосий босқичлари рақамлаштирилди.',
                  ru: 'Ключевые этапы подачи заявок и документооборота были цифровизированы.',
                  en: 'Core membership and document workflow stages were digitized.',
                ),
              ),
              InfoCard(
                badge: '2024',
                title: l(uz: 'Malaka oshirish dasturlari', cy: 'Малака ошириш дастурлари', ru: 'Программы повышения квалификации', en: 'Capacity-building programs'),
                description: l(
                  uz: "NNT rahbarlari uchun tizimli treninglar va ekspert seminarlar yo'lga qo'yildi.",
                  cy: 'ННТ раҳбарлари учун тизимли тренинглар ва эксперт семинарлар йўлга қўйилди.',
                  ru: 'Запущены системные тренинги и экспертные семинары для руководителей ННО.',
                  en: 'Systematic trainings and expert seminars were launched for NGO leaders.',
                ),
              ),
              InfoCard(
                badge: '2005',
                title: l(uz: 'Assotsiatsiya tashkil etildi', cy: 'Ассоциация ташкил этилди', ru: 'Создана ассоциация', en: 'Association established'),
                description: l(
                  uz: 'Fuqarolik jamiyati institutlari tashabbusi bilan milliy hamkorlik platformasi yaratildi.',
                  cy: 'Фуқаролик жамияти институтлари ташаббуси билан миллий ҳамкорлик платформаси яратилди.',
                  ru: 'Создана национальная платформа сотрудничества по инициативе институтов гражданского общества.',
                  en: 'A national collaboration platform was established by civil society institutions.',
                ),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Shaffoflik va hisobdorlik', cy: 'Шаффофлик ва ҳисобдорлик', ru: 'Прозрачность и подотчетность', en: 'Transparency and accountability'),
          child: AdaptiveGrid(
            minCardWidth: 220,
            maxColumns: 2,
            children: [
              InfoCard(
                title: l(uz: "Ochiq ma'lumotlar", cy: 'Очиқ маълумотлар', ru: 'Открытые данные', en: 'Open data'),
                description: l(uz: "Asosiy hisobotlar va me'yoriy hujjatlar bilan tanishish imkoniyati.", cy: 'Асосий ҳисоботлар ва меъёрий ҳужжатлар билан танишиш имконияти.', ru: 'Доступ к основным отчетам и нормативным документам.', en: 'Access to core reports and regulatory documents.'),
              ),
              InfoCard(
                title: l(uz: 'Ichki nazorat', cy: 'Ички назорат', ru: 'Внутренний контроль', en: 'Internal control'),
                description: l(uz: "Jarayonlar sifatini va me'yorlarga muvofiqligini doimiy monitoring qilish.", cy: 'Жараёнлар сифатини ва меъёрларга мувофиқлигини доимий мониторинг қилиш.', ru: 'Постоянный мониторинг качества процессов и соответствия стандартам.', en: 'Continuous monitoring of process quality and compliance.'),
              ),
              InfoCard(
                title: l(uz: 'Jamoatchilik ishtiroki', cy: 'Жамоатчилик иштироки', ru: 'Общественное участие', en: 'Public participation'),
                description: l(uz: "Muhokamalar, forumlar va fikr-mulohaza kanallari orqali muloqotni kuchaytirish.", cy: 'Муҳокамалар, форумлар ва фикр-мулоҳаза каналлари орқали мулоқотни кучайтириш.', ru: 'Укрепление диалога через обсуждения, форумы и каналы обратной связи.', en: 'Strengthening dialogue through forums and feedback channels.'),
              ),
              InfoCard(
                title: l(uz: 'Etika tamoyillari', cy: 'Этика тамойиллари', ru: 'Этические принципы', en: 'Ethical principles'),
                description: l(uz: "Halollik, manfaatlar to'qnashuvini oldini olish va ochiq boshqaruv standartlari.", cy: 'Ҳалоллик, манфаатлар тўқнашувини олдини олиш ва очиқ бошқарув стандартлари.', ru: 'Добросовестность, предотвращение конфликта интересов и стандарты открытого управления.', en: 'Integrity, conflict-of-interest prevention, and open governance standards.'),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          title: l(uz: 'Bizning jamoa (siz to‘ldirasiz)', cy: 'Бизнинг жамоа (сиз тўлдирасиз)', ru: 'Наша команда (заполняете вы)', en: 'Our team (to be filled by you)'),
          child: AdaptiveGrid(
            minCardWidth: 220,
            maxColumns: 2,
            children: [
              InfoCard(title: l(uz: 'Rais', cy: 'Раис', ru: 'Председатель', en: 'Chairperson'), badge: l(uz: "To'ldiriladi", cy: 'Тўлдирилади', ru: 'Заполняется', en: 'To be filled'), description: l(uz: "Ism-familiya, lavozim va qisqa bio ma'lumot shu yerga joylanadi.", cy: 'Исм-фамилия, лавозим ва қисқа био маълумот шу ерга жойланади.', ru: 'Имя, должность и краткая биография размещаются здесь.', en: 'Name, role, and short bio will be added here.')),
              InfoCard(title: l(uz: "Rais o'rinbosari", cy: 'Раис ўринбосари', ru: 'Заместитель председателя', en: 'Deputy chairperson'), badge: l(uz: "To'ldiriladi", cy: 'Тўлдирилади', ru: 'Заполняется', en: 'To be filled'), description: l(uz: "Ism-familiya, mas'ul yo'nalish va aloqa ma'lumotlari shu yerga joylanadi.", cy: 'Исм-фамилия, масъул йўналиш ва алоқа маълумотлари шу ерга жойланади.', ru: 'Имя, зона ответственности и контактные данные размещаются здесь.', en: 'Name, responsibility area, and contact details will be added here.')),
              InfoCard(title: l(uz: 'Ijro apparati rahbari', cy: 'Ижро аппарати раҳбари', ru: 'Руководитель исполнительного аппарата', en: 'Head of executive office'), badge: l(uz: "To'ldiriladi", cy: 'Тўлдирилади', ru: 'Заполняется', en: 'To be filled'), description: l(uz: "Ijro faoliyati va koordinatsiya bo'yicha ma'lumot shu yerga joylanadi.", cy: 'Ижро фаолияти ва координация бўйича маълумот шу ерга жойланади.', ru: 'Информация об операционной деятельности и координации размещается здесь.', en: 'Information on operations and coordination will be added here.')),
              InfoCard(title: l(uz: "Hududiy bo'linma koordinatori", cy: 'Ҳудудий бўлинма координатори', ru: 'Координатор регионального отделения', en: 'Regional coordinator'), badge: l(uz: "To'ldiriladi", cy: 'Тўлдирилади', ru: 'Заполняется', en: 'To be filled'), description: l(uz: "Hududiy ishlarga mas'ul vakil ma'lumotlari shu yerga joylanadi.", cy: 'Ҳудудий ишларга масъул вакил маълумотлари шу ерга жойланади.', ru: 'Данные ответственного регионального представителя размещаются здесь.', en: 'Details of the regional representative will be added here.')),
            ],
          ),
        ),
      ],
    );
  }
}
