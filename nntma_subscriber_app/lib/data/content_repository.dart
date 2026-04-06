import 'dart:math';

import 'content_models.dart';
import 'site_content.dart';

abstract class ContentRepository {
  Future<List<KpiData>> fetchKpis();
  Future<List<CardData>> fetchHomeNews();
  Future<List<CardData>> fetchAboutCards();
  Future<List<CardData>> fetchNewsCards();
  Future<List<CardData>> fetchEventCards();
  Future<List<CardData>> fetchServiceCards();
}

class MockContentRepository implements ContentRepository {
  final Duration delay;
  final bool unstable;
  final Random _rng = Random();

  MockContentRepository({this.delay = const Duration(milliseconds: 250), this.unstable = false});

  Future<T> _withLatency<T>(T data) async {
    await Future<void>.delayed(delay);
    if (unstable && _rng.nextInt(20) == 0) {
      throw Exception('Temporary network error');
    }
    return data;
  }

  @override
  Future<List<KpiData>> fetchKpis() => _withLatency(SiteContent.kpis);

  @override
  Future<List<CardData>> fetchHomeNews() => _withLatency(SiteContent.homeNews);

  @override
  Future<List<CardData>> fetchAboutCards() => _withLatency(SiteContent.aboutCards);

  @override
  Future<List<CardData>> fetchNewsCards() => _withLatency(SiteContent.newsCards);

  @override
  Future<List<CardData>> fetchEventCards() => _withLatency(SiteContent.eventCards);

  @override
  Future<List<CardData>> fetchServiceCards() => _withLatency(SiteContent.serviceCards);
}

ContentRepository contentRepository = MockContentRepository();
