import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/views/counter_view.dart';

void main() {
  testWidgets('CounterView has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterViewWidget()));

    // Verify the title
    expect(find.text('MVP Counter'), findsOneWidget);

    // Verify the initial message
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Increment button increments the counter', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterViewWidget()));

    // Verify initial counter value
    expect(find.text('0'), findsOneWidget);

    // Tap the increment button and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter has incremented
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Toggle text visibility test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterViewWidget()));

    // Verify that the initial state of the text widget is visible
    expect(find.text('This is a toggled text!'), findsOneWidget);

    // Tap the toggle button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the text widget is no longer visible
    expect(find.text('This is a toggled text!'), findsNothing);

    // Tap the toggle button again
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the text widget is visible again
    expect(find.text('This is a toggled text!'), findsOneWidget);
  });
}
