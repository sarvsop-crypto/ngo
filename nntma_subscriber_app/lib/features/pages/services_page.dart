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

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late final AsyncListController<CardData> _controller;

  @override
  void initState() {
    super.initState();
    _controller = AsyncListController<CardData>(loader: contentRepository.fetchServiceCards)..load();
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
      heroTitle: context.i18n.t('services.title'),
      heroSub: context.i18n.t('services.sub'),
      children: [
        ResponsiveSection(
          title: l(uz: 'Asosiy xizmatlar', cy: 'Асосий хизматлар', ru: 'Основные сервисы', en: 'Core services'),
          child: AsyncCardSection(controller: _controller),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Raqamli xizmatlar', cy: 'Рақамли хизматлар', ru: 'Цифровые сервисы', en: 'Digital services'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(
                title: l(uz: 'Onlayn ariza platformasi', cy: 'Онлайн ариза платформаси', ru: 'Платформа онлайн-заявок', en: 'Online application platform'),
                description: l(uz: "A'zolik arizasi, hujjatlar va holat kuzatuvini yagona oynada boshqarish.", cy: 'Аъзолик аризаси, ҳужжатлар ва ҳолат кузатувини ягона ойнада бошқариш.', ru: 'Управление заявками на членство, документами и статусом в одном окне.', en: 'Manage membership applications, documents, and status in one place.'),
              ),
              InfoCard(
                title: l(uz: 'Elektron hujjat almashinuvi', cy: 'Электрон ҳужжат алмашинуви', ru: 'Электронный документооборот', en: 'Electronic document exchange'),
                description: l(uz: "Hujjatlarni xavfsiz yuklash, tekshiruv izohlarini olish va yangilash.", cy: 'Ҳужжатларни хавфсиз юклаш, текширув изоҳларини олиш ва янгилаш.', ru: 'Безопасная загрузка документов, получение замечаний и обновление.', en: 'Securely upload documents, receive review comments, and update files.'),
              ),
              InfoCard(
                title: l(uz: 'Hisobot topshirish moduli', cy: 'Ҳисобот топшириш модули', ru: 'Модуль отчетности', en: 'Reporting module'),
                description: l(uz: 'Yillik va choraklik hisobotlarni standart shakllarda yuborish.', cy: 'Йиллик ва чораклик ҳисоботларни стандарт шаклларда юбориш.', ru: 'Отправка годовых и квартальных отчетов в стандартных формах.', en: 'Submit annual and quarterly reports in standard forms.'),
              ),
              InfoCard(
                title: l(uz: 'Bildirishnoma markazi', cy: 'Билдиришнома маркази', ru: 'Центр уведомлений', en: 'Notification center'),
                description: l(uz: 'Muddatlar, yangiliklar va tizim xabarnomalarini tezkor qabul qilish.', cy: 'Муддатлар, янгиликлар ва тизим хабарномаларини тезкор қабул қилиш.', ru: 'Быстрое получение уведомлений о сроках, новостях и системных событиях.', en: 'Get deadlines, news, and system alerts quickly.'),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          title: l(uz: 'Huquqiy va metodik yordam', cy: 'Ҳуқуқий ва методик ёрдам', ru: 'Юридическая и методическая поддержка', en: 'Legal and methodological support'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(title: l(uz: 'Huquqiy konsultatsiya', cy: 'Ҳуқуқий консультация', ru: 'Юридическая консультация', en: 'Legal consultation'), description: l(uz: "NNT faoliyatiga doir huquqiy savollar bo'yicha ekspert yordami.", cy: 'ННТ фаолиятига доир ҳуқуқий саволлар бўйича эксперт ёрдами.', ru: 'Экспертная поддержка по юридическим вопросам деятельности ННО.', en: 'Expert support for NGO legal matters.')),
              InfoCard(title: l(uz: "Me'yoriy hujjatlar bilan ishlash", cy: 'Меъёрий ҳужжатлар билан ишлаш', ru: 'Работа с нормативными документами', en: 'Work with regulations'), description: l(uz: "Qonun va qarorlar asosida amaliy yo'l-yo'riq berish.", cy: 'Қонун ва қарорлар асосида амалий йўл-йўриқ бериш.', ru: 'Практические рекомендации на основе законов и постановлений.', en: 'Practical guidance based on laws and regulations.')),
              InfoCard(title: l(uz: 'Loyiha hujjatlari ekspertizasi', cy: 'Лойиҳа ҳужжатлари экспертизаси', ru: 'Экспертиза проектной документации', en: 'Project document review'), description: l(uz: 'Ariza, byudjet va loyiha pasportlarini sifatli tayyorlashga ko‘mak.', cy: 'Ариза, бюджет ва лойиҳа паспортларини сифатли тайёрлашга кўмак.', ru: 'Поддержка в качественной подготовке заявок, бюджетов и паспортов проекта.', en: 'Support in preparing quality applications, budgets, and project files.')),
              InfoCard(title: l(uz: "Metodik qo'llanmalar", cy: 'Методик қўлланмалар', ru: 'Методические руководства', en: 'Methodological guides'), description: l(uz: "Tashkiliy boshqaruv va hisobot yuritish bo'yicha tayyor materiallar.", cy: 'Ташкилий бошқарув ва ҳисобот юритиш бўйича тайёр материаллар.', ru: 'Готовые материалы по управлению организацией и отчетности.', en: 'Ready materials on organizational management and reporting.')),
            ],
          ),
        ),
        ResponsiveSection(
          light: false,
          title: l(uz: 'Salohiyatni oshirish xizmatlari', cy: 'Салоҳиятни ошириш хизматлари', ru: 'Сервисы по развитию потенциала', en: 'Capacity-building services'),
          child: AdaptiveGrid(
            minCardWidth: 240,
            maxColumns: 2,
            children: [
              InfoCard(title: l(uz: 'Trening va seminarlar', cy: 'Тренинг ва семинарлар', ru: 'Тренинги и семинары', en: 'Trainings and seminars'), description: l(uz: "Rahbarlar va mutaxassislar uchun mavzuli amaliy o'quvlar.", cy: 'Раҳбарлар ва мутахассислар учун мавзули амалий ўқувлар.', ru: 'Практические тематические занятия для руководителей и специалистов.', en: 'Practical thematic training for managers and specialists.')),
              InfoCard(title: l(uz: 'Mentorlik dasturi', cy: 'Менторлик дастури', ru: 'Программа менторства', en: 'Mentorship program'), description: l(uz: 'Yangi NNTlar uchun tajribali ekspertlar bilan hamkorlik formati.', cy: 'Янги ННТлар учун тажрибали экспертлар билан ҳамкорлик формати.', ru: 'Формат работы с опытными экспертами для новых ННО.', en: 'A collaboration format with experienced experts for new NGOs.')),
              InfoCard(title: l(uz: "Hududiy uchrashuvlar", cy: 'Ҳудудий учрашувлар', ru: 'Региональные встречи', en: 'Regional meetings'), description: l(uz: "Viloyatlarda joyida konsultatsiya va muloqot sessiyalari.", cy: 'Вилоятларда жойида консультация ва мулоқот сессиялари.', ru: 'Очные консультации и диалоговые сессии в регионах.', en: 'On-site consultations and dialogue sessions in regions.')),
              InfoCard(title: l(uz: 'Tajriba almashish platformasi', cy: 'Тажриба алмашиш платформаси', ru: 'Платформа обмена опытом', en: 'Experience-sharing platform'), description: l(uz: "Muvaffaqiyatli amaliyotlarni ulashish va replikatsiya qilish mexanizmi.", cy: 'Муваффақиятли амалиётларни улашиш ва репликация қилиш механизми.', ru: 'Механизм обмена и тиражирования успешных практик.', en: 'A mechanism for sharing and replicating successful practices.')),
            ],
          ),
        ),
      ],
    );
  }
}
