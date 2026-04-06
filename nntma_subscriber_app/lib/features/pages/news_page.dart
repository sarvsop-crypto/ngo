import 'package:flutter/material.dart';

import '../../core/async_list_controller.dart';
import '../../data/content_models.dart';
import '../../data/content_repository.dart';
import '../../widgets/async_card_section.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final AsyncListController<CardData> _controller;

  @override
  void initState() {
    super.initState();
    _controller = AsyncListController<CardData>(loader: contentRepository.fetchNewsCards)..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      heroTitle: 'Yangiliklar',
      heroSub: 'NNT sektori va OZNNTMA faoliyati boyicha songgi xabarlar.',
      children: [
        ResponsiveSection(
          title: 'Songgi elonlar',
          child: AsyncCardSection(controller: _controller),
        ),
      ],
    );
  }
}
