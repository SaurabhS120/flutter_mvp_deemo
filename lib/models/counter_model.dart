class CounterModel {
  int _counter = 0;
  bool _isTextVisible = true;

  int get counter => _counter;
  bool get isTextVisible => _isTextVisible;

  void increment() {
    _counter++;
  }

  void toggleTextVisibility(){
    print("_isTextVisible $_isTextVisible");
    _isTextVisible =! _isTextVisible;
    print("_isTextVisible $_isTextVisible");
  }
}
