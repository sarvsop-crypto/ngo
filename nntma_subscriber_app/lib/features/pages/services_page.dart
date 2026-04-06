import 'package:flutter/material.dart';

import '../../core/async_list_controller.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/async_card_section.dart';
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      heroTitle: 'Xizmatlar',
      heroSub: 'NNTlar uchun hujjatlar, hisobot, maslahat va murojaat xizmatlari.',
      children: [
        ResponsiveSection(
          title: 'Asosiy xizmatlar',
          child: AsyncCardSection(controller: _controller),
        ),
      ],
    );
  }
}
