import 'package:flutter/material.dart';

import '../../core/async_list_controller.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/async_card_section.dart';
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      heroTitle: 'Tadbirlar',
      heroSub: 'Seminar, trening va ochiq muloqot uchrashuvlari jadvali.',
      children: [
        ResponsiveSection(
          title: 'Yaqin tadbirlar',
          child: AsyncCardSection(controller: _controller),
        ),
      ],
    );
  }
}
