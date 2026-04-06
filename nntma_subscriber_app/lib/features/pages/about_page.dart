import 'package:flutter/material.dart';

import '../../core/async_list_controller.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/async_card_section.dart';
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      heroTitle: 'Biz haqimizda',
      heroSub: 'OZNNTMA fuqarolik jamiyati institutlari uchun milliy hamkorlik platformasi.',
      children: [
        ResponsiveSection(
          title: 'Ichki bolimlar',
          child: AsyncCardSection(controller: _controller),
        ),
      ],
    );
  }
}
