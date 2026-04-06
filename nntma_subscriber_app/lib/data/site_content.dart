import 'content_models.dart';

class SiteContent {
  static const kpis = [
    KpiData(value: '44', label: 'Jami xodimlar'),
    KpiData(value: '16', label: 'Markaziy apparat'),
    KpiData(value: '28', label: 'Hududiy bolinma'),
    KpiData(value: '2005', label: 'Tashkil etilgan'),
  ];

  static const homeNews = [
    CardData(
      title: 'NNTlar uchun yangi grant dasturi ochildi',
      description: 'Yangi loyiha yonalishlari boyicha arizalar qabuli boshlandi.',
      badge: 'Grantlar',
    ),
    CardData(
      title: 'Hududiy seminarlar taqvimi yangilandi',
      description: '2026 yil uchun barcha hududlar kesimida tadbir jadvali elon qilindi.',
      badge: 'Tadbirlar',
    ),
  ];

  static const aboutCards = [
    CardData(title: 'Tashkilot haqida', description: 'Tarix, maqsad va institutsional yonalishlar.'),
    CardData(title: 'Rahbariyat', description: 'Kengash raisi va orinbosarlar tarkibi.'),
    CardData(title: 'Bizning jamoa', description: 'Ijro etuvchi devon va hududiy bolinmalar xodimlari.'),
    CardData(title: 'Tuzilma', description: 'Tashkiliy daraxt va bolimlar kesimi.'),
  ];

  static const newsCards = [
    CardData(
      title: 'Ijtimoiy sheriklik forumi yakunlandi',
      description: 'Forum natijalari va keyingi bosqich rejasi elon qilindi.',
      badge: 'Forum',
    ),
    CardData(
      title: 'Yangi huquqiy qollanma taqdim etildi',
      description: 'NNTlar uchun huquqiy amaliyotlar boyicha metodik qollanma chop etildi.',
      badge: 'Hujjat',
    ),
  ];

  static const eventCards = [
    CardData(
      title: 'Toshkent: NNTlar uchun grant yozish master-klass',
      description: '24-aprel, 10:00 - 13:00, OZNNTMA markaziy ofisi',
      badge: 'Royxatdan otish ochiq',
    ),
    CardData(
      title: 'Samarqand: Ijtimoiy loyiha boshqaruvi',
      description: '30-aprel, 14:00 - 17:00, Hududiy bolinma ofisi',
      badge: 'Rejalashtirilgan',
    ),
  ];

  static const serviceCards = [
    CardData(title: 'Rasmiy hujjatlar', description: 'Meyoriy hujjatlar va namunaviy shakllar kutubxonasi.'),
    CardData(title: 'Hisobot shakllari', description: 'Yillik va choraklik hisobot topshirish blankalari.'),
    CardData(title: 'Savol-javob', description: 'Eng kop beriladigan savollarga amaliy javoblar.'),
    CardData(title: 'Murojaat yuborish', description: 'Rasmiy onlayn murojaat yuborish va kuzatish.'),
  ];
}
