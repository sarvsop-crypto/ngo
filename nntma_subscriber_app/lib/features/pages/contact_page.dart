import 'package:flutter/material.dart';

import '../../widgets/cards.dart';
import '../../widgets/contact_form.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      heroTitle: 'Boglanish',
      heroSub: 'Murojaat, hamkorlik yoki savollar uchun biz bilan boglaning.',
      children: [
        ResponsiveSection(
          title: 'Kontaktlar va murojaat',
          child: ContactCards(
            left: InfoCard(
              title: 'Aloqa malumotlari',
              description: 'Telefon: (+998 55) 503-05-12\nEmail: info@ngo.uz\nManzil: Furqat kochasi 1A, Shayxontohur tumani, Toshkent',
            ),
            right: ContactForm(),
          ),
        ),
      ],
    );
  }
}
