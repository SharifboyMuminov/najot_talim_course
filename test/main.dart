import 'package:default_project/main.dart' as home;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  home.main();

  group("Test", () {
    testWidgets("Test Ui", (widgetTester) async {
      await widgetTester.pumpWidget(const home.MyApp());

      final button_S = find.byKey(const Key('s'));
      final button_U = find.byKey(const Key('u'));
      final button_T = find.byKey(const Key('t'));

      await widgetTester.tap(button_S);
      await Future.delayed(Duration(seconds: 1));
      await widgetTester.tap(button_U);
      await Future.delayed(Duration(seconds: 1));
      await widgetTester.tap(button_T);
      await Future.delayed(Duration(seconds: 1));
      await widgetTester.pumpAndSettle();
    });
  });
}
