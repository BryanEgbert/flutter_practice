// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/todo.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Should add todo when user insert new todo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const Todo(todos: <String>[], todoCheckbox: <bool>[]));
        await tester.pumpWidget(MaterialApp(
          title: "Flutter Test",
          home: Scaffold(
            appBar: AppBar(title: const Text("Flutter Demo")),
            body: const Todo(todos: <String>[], todoCheckbox: <bool>[]),
          ),
        ));

    await tester.enterText(find.byKey(const Key("todo form")), "Buy milk\n");
    

    await tester.pump();  

    expect(find.text('Buy milk'), findsOneWidget);

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
