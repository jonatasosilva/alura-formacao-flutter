import 'package:bytebank2/main.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:bytebank2/screens/contact_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  MockContactDao mockContactDao;

  setUp(() async {
    mockContactDao = MockContactDao();
  });

  testWidgets('Should save a contact', (tester) async {
    await tester.pumpWidget(
      BytebankApp(contactDao: mockContactDao),
    );

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    await clickOnTheFabNew(tester);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    await fillTextFieldWithTextLabel(tester, text: 'Jonatas', labelText: 'Full name');

    await fillTextFieldWithTextLabel(tester, labelText: 'Account number', text: '1000');

    await clickOnTheButton(tester, 'Create', ElevatedButton);
    await tester.pumpAndSettle();

    verify(mockContactDao.save(Contact(0, 'Jonatas', 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}
