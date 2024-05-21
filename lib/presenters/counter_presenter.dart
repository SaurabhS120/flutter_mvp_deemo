import '../models/counter_model.dart';

abstract class CounterView {
  void updateCounter(int counter);
  void updateVisibility(bool visibility);
}

class CounterPresenter {
  final CounterModel _model;
  late CounterView _view;


  CounterPresenter(this._model);

  set view(CounterView view) {
    _view = view;
    _view.updateCounter(_model.counter);
  }

  void increment() {
    _model.increment();
    _view.updateCounter(_model.counter);
  }

  void toggleTextVisibility() {
    _model.toggleTextVisibility();
    print("_model.isTextVisible ${_model.isTextVisible}");
    _view.updateVisibility(_model.isTextVisible);
  }
}
