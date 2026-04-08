import 'package:flutter/material.dart';

import '../../core/app_i18n.dart';
import '../../widgets/adaptive_grid.dart';
import '../../widgets/cards.dart';
import '../../widgets/contact_form.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      heroTitle: context.i18n.t('contact.title'),
      heroSub: context.i18n.t('contact.sub'),
      children: [
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: 'Boglanish yonalishlari',
            uzCyrillic: 'Богланиш йўналишлари',
            russian: 'Направления обращений',
            english: 'Contact directions',
          ),
          subtitle: context.i18n.pick(
            uzLatin: 'Savol va murojaatingizga qarab tegishli yonalishni tanlang.',
            uzCyrillic: 'Савол ва мурожаатингизга қараб тегишли йўналишни танланг.',
            russian: 'Выберите нужное направление в зависимости от вашего запроса.',
            english: 'Choose the right direction based on your request.',
          ),
          child: AdaptiveGrid(
            minCardWidth: 230,
            maxColumns: 3,
            spacing: 10,
            children: [
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: "A'zolik va arizalar bo'limi",
                  uzCyrillic: 'Аъзолик ва аризалар бўлими',
                  russian: 'Отдел членства и заявок',
                  english: 'Membership and applications unit',
                ),
                description: context.i18n.pick(
                  uzLatin: "A'zolik jarayoni, ariza statusi va hujjatlar bo'yicha savollar.",
                  uzCyrillic: 'Аъзолик жараёни, ариза ҳолати ва ҳужжатлар бўйича саволлар.',
                  russian: 'Вопросы по членству, статусу заявок и документам.',
                  english: 'Questions about membership, application status, and documents.',
                ),
                badge: context.i18n.pick(uzLatin: "Bo'lim", uzCyrillic: 'Бўлим', russian: 'Отдел', english: 'Unit'),
              ),
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: "Huquqiy maslahat bo'limi",
                  uzCyrillic: 'Ҳуқуқий маслаҳат бўлими',
                  russian: 'Юридический консультационный отдел',
                  english: 'Legal advisory unit',
                ),
                description: context.i18n.pick(
                  uzLatin: "NNT faoliyati, me'yoriy hujjatlar va amaliy huquqiy tushuntirishlar.",
                  uzCyrillic: 'ННТ фаолияти, меъёрий ҳужжатлар ва амалий ҳуқуқий тушунтиришлар.',
                  russian: 'Вопросы деятельности ННО, нормативных документов и практических разъяснений.',
                  english: 'Guidance on NGO operations, regulations, and legal practice.',
                ),
                badge: context.i18n.pick(uzLatin: "Bo'lim", uzCyrillic: 'Бўлим', russian: 'Отдел', english: 'Unit'),
              ),
              InfoCard(
                title: context.i18n.pick(
                  uzLatin: "Loyiha va grantlar bo'limi",
                  uzCyrillic: 'Лойиҳа ва грантлар бўлими',
                  russian: 'Отдел проектов и грантов',
                  english: 'Projects and grants unit',
                ),
                description: context.i18n.pick(
                  uzLatin: "Grant tanlovlari, loyiha hujjatlari va hamkorlik masalalari.",
                  uzCyrillic: 'Грант танловлари, лойиҳа ҳужжатлари ва ҳамкорлик масалалари.',
                  russian: 'Грантовые конкурсы, проектные документы и вопросы сотрудничества.',
                  english: 'Grant calls, project documentation, and partnership issues.',
                ),
                badge: context.i18n.pick(uzLatin: "Bo'lim", uzCyrillic: 'Бўлим', russian: 'Отдел', english: 'Unit'),
              ),
            ],
          ),
        ),
        ResponsiveSection(
          title: context.i18n.pick(
            uzLatin: 'Kontaktlar va murojaat',
            uzCyrillic: 'Контактлар ва мурожаат',
            russian: 'Контакты и обращение',
            english: 'Contacts and request',
          ),
          child: ContactCards(
            left: InfoCard(
              title: context.i18n.pick(
                uzLatin: "Aloqa ma'lumotlari",
                uzCyrillic: 'Алоқа маълумотлари',
                russian: 'Контактные данные',
                english: 'Contact details',
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
