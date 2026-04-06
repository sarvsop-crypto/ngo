import 'package:flutter/foundation.dart';

import 'load_state.dart';

class AsyncListController<T> extends ChangeNotifier {
  final Future<List<T>> Function() _loader;

  LoadState _state = LoadState.idle;
  List<T> _items = const [];
  Object? _error;

  AsyncListController({required Future<List<T>> Function() loader}) : _loader = loader;

  LoadState get state => _state;
  List<T> get items => _items;
  Object? get error => _error;

  Future<void> load() async {
    _state = LoadState.loading;
    _error = null;
    notifyListeners();

    try {
      final result = await _loader();
      _items = result;
      _state = result.isEmpty ? LoadState.empty : LoadState.ready;
    } catch (err) {
      _error = err;
      _items = const [];
      _state = LoadState.error;
    }

    notifyListeners();
  }
}
