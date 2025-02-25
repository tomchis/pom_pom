import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pom_pom/l10n/app_localizations_en.dart';

import 'package:pom_pom/main.dart';
import 'package:pom_pom/providers/settings_provider.dart';
import 'package:pom_pom/widgets/settings_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();

  setUp(() {
    try {
      windowManager.ensureInitialized();
      windowManager.setSize(const Size(300, 350));
      windowManager.show();
      windowManager.focus();
    } catch (_) {}
  });

  testWidgets('Default state', (WidgetTester tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 0.8;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [preferencesProvider.overrideWith((ref) => prefs)],
        child: const MyApp(),
      ),
    );

    expect(find.text('25:00'), findsOneWidget);
    expect(find.text(AppLocalizationsEn().focus), findsOneWidget);
    expect(find.text('1/4'), findsOneWidget);
  });

  testWidgets('Modify time/rounds', (WidgetTester tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 0.8;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [preferencesProvider.overrideWith((ref) => prefs)],
        child: const MyApp(),
      ),
    );

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.byType(Slider).first);
    await tester.pump();
    await tester.tap(find.byType(Slider).at(3));
    await tester.pump();
    await tester.tap(find.text(AppLocalizationsEn().dismiss));
    await tester.pumpAndSettle();

    expect(find.text('30:00'), findsOneWidget);
    expect(find.text('1/30'), findsOneWidget);
  });

  testWidgets('Reset', (WidgetTester tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 0.8;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [preferencesProvider.overrideWith((ref) => prefs)],
        child: const MyApp(),
      ),
    );

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.byType(Slider).first);
    await tester.pump();
    await tester.tap(find.text(AppLocalizationsEn().dismiss));
    await tester.pumpAndSettle();

    expect(find.text('30:00'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(
      find.descendant(
        matching: find.text(AppLocalizationsEn().reset),
        of: find.byType(SettingsSheet),
      ),
    );
    await tester.pump();
    await tester.tap(find.text(AppLocalizationsEn().dismiss));
    await tester.pumpAndSettle();
    expect(find.text('25:00'), findsOneWidget);
  });
}
