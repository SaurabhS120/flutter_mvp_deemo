import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/counter_model.dart';

void main() {
  group('CounterModel Test', () {
    test('Initial counter value should be 0', () {
      final model = CounterModel();
      expect(model.counter, 0);
    });

    test('Counter value should be incremented', () {
      final model = CounterModel();
      model.increment();
      expect(model.counter, 1);
    });
  });
}
