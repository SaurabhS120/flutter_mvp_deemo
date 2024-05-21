import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/counter_model.dart';
import '../../lib/presenters/counter_presenter.dart';

class MockCounterView implements CounterView {
  late int counter;
  late bool textVisibility;

  @override
  void updateCounter(int counter) {
    this.counter = counter;
  }

  @override
  void updateVisibility(bool visibility) {
    this.textVisibility = visibility;
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

    test('Toggle text visibility should be incremented via presenter', () {
      final model = CounterModel();
      final view = MockCounterView();
      final presenter = CounterPresenter(model);
      presenter.view = view;

      presenter.toggleTextVisibility();
      expect(view.textVisibility, false);
    });
  });


}
