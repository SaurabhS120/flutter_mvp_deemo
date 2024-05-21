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
  bool _isTextVisible = true;

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
  void updateVisibility(bool visibility){
    setState(() {
      _isTextVisible = visibility;
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
            if (_isTextVisible) // Conditionally show text based on _isTextVisible
              Text(
                'This is a toggled text!',
                style: TextStyle(color: Colors.blue),
              ),
            SizedBox(height: 20), // Add some space
            ElevatedButton(
              onPressed: _presenter.toggleTextVisibility, // Button to toggle text visibility
              child: Text('Toggle Text Visibility'),
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
