import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/counter_model.dart';
import '../../lib/presenters/counter_presenter.dart';

class MockCounterView implements CounterView {
  late int counter;

  @override
  void updateCounter(int counter) {
    this.counter = counter;
  }
}

void main() {
  group('CounterPresenter Test', () {
    test('Initial counter value should be 0', () {
      final model = CounterModel();
      final view = MockCounterView();
      final presenter = CounterPresenter(model);
      presenter.view = view;

      expect(view.counter, 0);
    });

    test('Counter value should be incremented via presenter', () {
      final model = CounterModel();
      final view = MockCounterView();
      final presenter = CounterPresenter(model);
      presenter.view = view;

      presenter.increment();
      expect(view.counter, 1);
    });
  });
}
