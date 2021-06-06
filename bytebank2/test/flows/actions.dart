import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';

Future<void> clickOnTheTransferFeatureItem(WidgetTester tester) async {
  final transferFeautureItem = find.byWidgetPredicate((widget) =>
      featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
  expect(transferFeautureItem, findsOneWidget);
  return tester.tap(transferFeautureItem);
}

Future<void> clickOnTheFabNew(WidgetTester tester) async {
  final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
  expect(fabNewContact, findsOneWidget);
  return tester.tap(fabNewContact);
}

Future<void> fillTextFieldWithTextLabel(
  WidgetTester tester, {
  String text = '',
  @required String labelText,
}) async {
  final textField = find.byWidgetPredicate(
      (widget) => textFieldByLabelTextMatcher(widget, labelText));
  expect(textField, findsOneWidget);
  return tester.enterText(textField, text);
}

Future<void> clickOnTheButton(WidgetTester tester, String text, Type widgetButton) async {
  final button = find.widgetWithText(widgetButton, text);
  expect(button, findsOneWidget);
  return tester.tap(button);
}
