import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel<State> extends Notifier<State> {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  final bag = CompositeSubscription();

  BaseViewModel() {
    _isDisposed = false;
  }

  void setState(State Function(State s) updater) {
    state = updater(state);
  }
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;
    }
    bag.clear();
  }
}
