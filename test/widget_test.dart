import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pertemuan_2/main.dart';

void main() {
  testWidgets('App loads and shows Home Menu', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());

    // Cek apakah ada teks Home Menu
    expect(find.text('Home Menu'), findsOneWidget);

    // Cek tombol Counter Page
    expect(find.text('Counter Page'), findsOneWidget);

    // Cek tombol Info Page
    expect(find.text('Info Page'), findsOneWidget);
  });
}