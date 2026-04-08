import '../core/app_language.dart';
import 'content_models.dart';

class SiteContent {
  static List<KpiData> get kpis {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          KpiData(value: '2500+', label: 'Member NGOs'),
          KpiData(value: '14', label: 'Regional branches'),
          KpiData(value: '100+', label: 'Annual events'),
          KpiData(value: '2005', label: 'Founded'),
        ];
      case AppLanguage.russian:
        return const [
          KpiData(value: '2500+', label: 'ННО в ассоциации'),
          KpiData(value: '14', label: 'Региональных отделений'),
          KpiData(value: '100+', label: 'Событий в год'),
          KpiData(value: '2005', label: 'Год основания'),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          KpiData(value: '2500+', label: 'Азоликдаги ННТлар'),
          KpiData(value: '14', label: 'Ҳудудий бўлинма'),
          KpiData(value: '100+', label: 'Йиллик тадбирлар'),
          KpiData(value: '2005', label: 'Ташкил этилган йил'),
        ];
      case AppLanguage.uzLatin:
        return const [
          KpiData(value: '2500+', label: 'Azolikdagi NNTlar'),
          KpiData(value: '14', label: 'Hududiy bolinma'),
          KpiData(value: '100+', label: 'Yillik tadbirlar'),
          KpiData(value: '2005', label: 'Tashkil etilgan yil'),
        ];
    }
  }

  static List<CardData> get homeNews {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          CardData(
            title: 'Capacity building program launched for NGOs',
            description: 'Regional training sessions are ongoing for project management, reporting and grant writing.',
            badge: 'Announcement',
          ),
          CardData(
            title: 'New format for public hearings introduced',
            description: 'Open thematic dialogue sessions are being launched with NGOs, public agencies and experts.',
            badge: 'Update',
          ),
          CardData(
            title: 'Membership application flow is now fully digital',
            description: 'Submission, document upload and status tracking are unified in one platform.',
            badge: 'Platform',
          ),
        ];
      case AppLanguage.russian:
        return const [
          CardData(
            title: 'Запущена программа повышения потенциала ННО',
            description: 'В регионах проходят тренинги по управлению проектами, отчетности и подготовке грантов.',
            badge: 'Объявление',
          ),
          CardData(
            title: 'Внедрен новый формат общественных слушаний',
            description: 'Запускаются тематические открытые обсуждения с ННО, госорганами и экспертами.',
            badge: 'Обновление',
          ),
          CardData(
            title: 'Процесс подачи на членство полностью оцифрован',
            description: 'Подача заявки, загрузка документов и отслеживание статуса доступны в одной платформе.',
            badge: 'Платформа',
          ),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          CardData(
            title: 'ННТ вакиллари учун малака ошириш курслари бошланди',
            description: 'Ҳудудлар кесимида лойиҳа бошқаруви, ҳисобот ва грант ёзиш бўйича тренинглар ўтказилмоқда.',
            badge: 'Элон',
          ),
          CardData(
            title: 'Жамоатчилик эшитувлари учун янги мулоқот формати йўлга қўйилди',
            description: 'ННТлар, давлат органлари ва экспертлар иштирокида мавзули очиқ муҳокамалар бошланмоқда.',
            badge: 'Янгилик',
          ),
          CardData(
            title: 'Азолик аризаларини топшириш жараёни тўлиқ рақамлаштирилди',
            description: 'Ариза юбориш, ҳужжат юклаш ва ҳолатни кузатиш босқичлари ягона платформада жамланди.',
            badge: 'Платформа',
          ),
        ];
      case AppLanguage.uzLatin:
        return const [
          CardData(
            title: 'NNT vakillari uchun malaka oshirish kurslari boshlandi',
            description: 'Hududlar kesimida loyiha boshqaruvi, hisobot va grant yozish boyicha treninglar otkazilmoqda.',
            badge: 'Elon',
          ),
          CardData(
            title: 'Jamoatchilik eshituvlari uchun yangi muloqot formati yoLga qoyildi',
            description: 'NNTlar, davlat organlari va ekspertlar ishtirokida mavzuli ochiq muhokamalar boshlanmoqda.',
            badge: 'Yangilik',
          ),
          CardData(
            title: 'Azolik arizalarini topshirish jarayoni toliq raqamlashtirildi',
            description: 'Ariza yuborish, hujjat yuklash va holatni kuzatish bosqichlari yagona platformada jamlandi.',
            badge: 'Platforma',
          ),
        ];
    }
  }

  static List<CardData> get aboutCards {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          CardData(title: 'About organization', description: 'History, mission, strategy and key directions.'),
          CardData(title: 'Leadership', description: 'Council and executive management structure.'),
          CardData(title: 'Our team', description: 'Central office and regional teams (editable by you).'),
          CardData(title: 'Member NGOs', description: 'List of member organizations (editable by you).'),
        ];
      case AppLanguage.russian:
        return const [
          CardData(title: 'О организации', description: 'История, миссия, стратегия и ключевые направления.'),
          CardData(title: 'Руководство', description: 'Структура совета и исполнительного аппарата.'),
          CardData(title: 'Наша команда', description: 'Центральный офис и региональные команды (заполняется вами).'),
          CardData(title: 'ННО-члены', description: 'Список организаций-членов ассоциации (заполняется вами).'),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          CardData(title: 'Ташкилот ҳақида', description: 'Тарих, миссия, стратегик мақсад ва асосий йўналишлар.'),
          CardData(title: 'Раҳбарият', description: 'Кенгаш ва ижро аппарати бошқарув даражалари.'),
          CardData(title: 'Бизнинг жамоа', description: 'Марказий аппарат ва ҳудудий бўлинмалар таркиби (сиз тўлдирасиз).'),
          CardData(title: 'Азоликдаги ННТлар', description: 'Ассоциацияга аъзо бўлган ташкилотлар рўйхати (сиз тўлдирасиз).'),
        ];
      case AppLanguage.uzLatin:
        return const [
          CardData(title: 'Tashkilot haqida', description: 'Tarix, missiya, strategik maqsad va asosiy yonalishlar.'),
          CardData(title: 'Rahbariyat', description: 'Kengash va ijro apparati boshqaruv darajalari.'),
          CardData(title: 'Bizning jamoa', description: 'Markaziy apparat va hududiy bolinmalar tarkibi (siz toldirasiz).'),
          CardData(title: 'Azolikdagi NNTlar', description: 'Assotsiatsiyaga azo bolgan tashkilotlar royxati (siz toldirasiz).'),
        ];
    }
  }

  static List<CardData> get newsCards {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          CardData(
            title: 'Social partnership forum outcomes announced',
            description: 'Priority tracks for cooperation between NGOs and public institutions were defined.',
            badge: 'Forum',
          ),
          CardData(
            title: 'New legal practice handbook presented',
            description: 'A new practical guide was released for registration, reporting and monitoring processes.',
            badge: 'Document',
          ),
        ];
      case AppLanguage.russian:
        return const [
          CardData(
            title: 'Опубликованы итоги форума социального партнерства',
            description: 'Определены приоритетные направления сотрудничества между ННО и госорганами.',
            badge: 'Форум',
          ),
          CardData(
            title: 'Представлено новое правовое практическое руководство',
            description: 'Опубликованы методические материалы по регистрации, отчетности и мониторингу.',
            badge: 'Документ',
          ),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          CardData(
            title: 'Ижтимоий шериклик форуми якунлари элон қилинди',
            description: 'Форум доирасида ННТлар ва давлат идоралари ўртасидаги ҳамкорлик учун устувор йўналишлар белгиланди.',
            badge: 'Форум',
          ),
          CardData(
            title: 'ННТлар учун ҳуқуқий амалий қўлланма тақдим этилди',
            description: 'Ташкилотларни рўйхатдан ўтказиш, ҳисобот ва мониторинг жараёнлари бўйича янги методик материал чоп этилди.',
            badge: 'Ҳужжат',
          ),
        ];
      case AppLanguage.uzLatin:
        return const [
          CardData(
            title: 'Ijtimoiy sheriklik forumi yakunlari elon qilindi',
            description: 'Forum doirasida NNTlar va davlat idoralari ortasidagi hamkorlik uchun ustuvor yonalishlar belgilandi.',
            badge: 'Forum',
          ),
          CardData(
            title: 'NNTlar uchun huquqiy amaliy qollanma taqdim etildi',
            description: 'Tashkilotlarni royxatdan otkazish, hisobot va monitoring jarayonlari boyicha yangi metodik material chop etildi.',
            badge: 'Hujjat',
          ),
        ];
    }
  }

  static List<CardData> get eventCards {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          CardData(
            title: 'Tashkent: grant writing workshop for NGOs',
            description: 'April 24, 10:00-13:00, OZNNTMA central office',
            badge: 'Registration open',
          ),
          CardData(
            title: 'Samarkand: social project management training',
            description: 'April 30, 14:00-17:00, regional branch office',
            badge: 'Scheduled',
          ),
        ];
      case AppLanguage.russian:
        return const [
          CardData(
            title: 'Ташкент: воркшоп по подготовке грантовых заявок',
            description: '24 апреля, 10:00-13:00, центральный офис OZNNTMA',
            badge: 'Регистрация открыта',
          ),
          CardData(
            title: 'Самарканд: тренинг по управлению социальными проектами',
            description: '30 апреля, 14:00-17:00, региональный офис',
            badge: 'Запланировано',
          ),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          CardData(
            title: 'Тошкент: ННТлар учун грант ёзиш амалий семинари',
            description: '24-апрел, 10:00-13:00, ОЗННТМА марказий офиси',
            badge: 'Рўйхатдан ўтиш очиқ',
          ),
          CardData(
            title: 'Самарқанд: ижтимоий лойиҳа бошқаруви тренинги',
            description: '30-апрел, 14:00-17:00, ҳудудий бўлинма офиси',
            badge: 'Режалаштирилган',
          ),
        ];
      case AppLanguage.uzLatin:
        return const [
          CardData(
            title: 'Toshkent: NNTlar uchun grant loyihasi yozish amaliy seminari',
            description: '24-aprel, 10:00 - 13:00, OZNNTMA markaziy ofisi',
            badge: 'Royxatdan otish ochiq',
          ),
          CardData(
            title: 'Samarqand: Ijtimoiy loyiha boshqaruvi treningi',
            description: '30-aprel, 14:00 - 17:00, Hududiy bolinma ofisi',
            badge: 'Rejalashtirilgan',
          ),
        ];
    }
  }

  static List<CardData> get serviceCards {
    switch (appLanguageController.value) {
      case AppLanguage.english:
        return const [
          CardData(title: 'Official documents', description: 'Legal documents, resolutions and templates library.'),
          CardData(title: 'Reporting forms', description: 'Annual and quarterly reporting templates and guidance.'),
          CardData(title: 'FAQ', description: 'Practical answers to the most common questions.'),
          CardData(title: 'Submit request', description: 'Send online requests and track status.'),
        ];
      case AppLanguage.russian:
        return const [
          CardData(title: 'Официальные документы', description: 'База нормативных документов, решений и шаблонов.'),
          CardData(title: 'Формы отчетности', description: 'Шаблоны годовой и квартальной отчетности и инструкции.'),
          CardData(title: 'Вопрос-ответ', description: 'Практические ответы на часто задаваемые вопросы.'),
          CardData(title: 'Отправить обращение', description: 'Онлайн-подача обращения и отслеживание статуса.'),
        ];
      case AppLanguage.uzCyrillic:
        return const [
          CardData(title: 'Расмий ҳужжатлар', description: 'Меёрий ҳужжатлар, қарорлар ва намунавий шакллар кутубхонаси.'),
          CardData(title: 'Ҳисобот шакллари', description: 'Йиллик ва чораклик ҳисобот бланкалари ҳамда топшириш тартиби.'),
          CardData(title: 'Савол-жавоб', description: 'Энг кўп бериладиган саволларга тезкор амалий жавоблар.'),
          CardData(title: 'Мурожаат юбориш', description: 'Расмий онлайн мурожаат юбориш, рақам олиш ва ҳолатни кузатиш.'),
        ];
      case AppLanguage.uzLatin:
        return const [
          CardData(title: 'Rasmiy hujjatlar', description: 'Meyoriy hujjatlar, qarorlar va namunaviy shakllar kutubxonasi.'),
          CardData(title: 'Hisobot shakllari', description: 'Yillik va choraklik hisobot blankalari hamda topshirish tartibi.'),
          CardData(title: 'Savol-javob', description: 'Eng kop beriladigan savollarga tezkor amaliy javoblar.'),
          CardData(title: 'Murojaat yuborish', description: 'Rasmiy onlayn murojaat yuborish, raqam olish va holatni kuzatish.'),
        ];
    }
  }
}
