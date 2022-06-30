import 'package:coinstats/views/screans/help/home_help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    const testWidget = MaterialApp(home: HomeHelpSeans());
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Help'), findsWidgets);
    expect(find.byIcon(Icons.error), findsWidgets);
  });
}
