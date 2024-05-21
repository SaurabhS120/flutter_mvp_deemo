import 'package:flutter/material.dart';
import '../models/counter_model.dart';
import '../presenters/counter_presenter.dart';

class CounterViewWidget extends StatefulWidget {
  @override
  _CounterViewWidgetState createState() => _CounterViewWidgetState();
}

class _CounterViewWidgetState extends State<CounterViewWidget> implements CounterView {
  final CounterModel _model = CounterModel();
  late CounterPresenter _presenter;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _presenter = CounterPresenter(_model);
    _presenter.view = this;
  }

  @override
  void updateCounter(int counter) {
    setState(() {
      _counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _presenter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
