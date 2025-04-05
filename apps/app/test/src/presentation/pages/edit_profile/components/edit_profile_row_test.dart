// ignore_for_file: lines_longer_than_80_chars
import 'package:app/src/presentation/pages/edit_profile/components/edit_profile_row.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locales/locales.dart';

void main() {
  final name = faker.lorem.word();
  final text = faker.lorem.sentence();

  group('EditProfileRow', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required String name,
      required String? text,
      required VoidCallback? onTap,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: EditProfileRow(
                name: name,
                text: text,
                onTap: onTap,
              ),
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('EditProfileRow を表示すると、name, text が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          name: name,
          text: text,
          onTap: () => fail('unexpected onTap'),
        );
        expect(find.text(name), findsOneWidget);
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('EditProfileRow をタップしたら onTap が呼ばれること', (tester) async {
        var onTapCallCount = 0;
        await pumpWidget(
          tester: tester,
          name: name,
          text: text,
          onTap: () {
            onTapCallCount++;
          },
        );
        expect(onTapCallCount, 0);
        await tester.tap(find.byType(EditProfileRow));
        expect(onTapCallCount, 1);
      });
    });
  });

  group('EditProfileRow.loading', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required String name,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: EditProfileRow.loading(
                name: name,
              ),
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('name が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          name: name,
        );
        expect(find.text(name), findsOneWidget);
      });
    });
  });
}
