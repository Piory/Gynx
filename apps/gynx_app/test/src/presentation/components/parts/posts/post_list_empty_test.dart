// ignore_for_file: lines_longer_than_80_charsutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/parts/posts/post_list_empty.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';

void main() {
  final l10nJa = L10nJa();

  group('PostListEmpty', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      Icon? icon,
      String? message,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: PostListEmpty(
                icon: icon,
                message: message,
              ),
            ),
          ),
        ),
      );
    }

    group('正常系', () {
      testWidgets(
        'icon を指定しなかったら、IconlyLight.paper_negative が表示されていること',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          expect(find.byIcon(IconlyLight.paper_negative), findsOneWidget);
        },
      );

      testWidgets(
        'message を指定しなかったら、「${l10nJa.postListEmpty}」が表示されていること',
        (tester) async {
          await pumpWidget(
            tester: tester,
          );
          expect(find.text(l10nJa.postListEmpty), findsOneWidget);
        },
      );

      testWidgets(
        'icon を指定したら、指定した icon が表示されていること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            icon: const Icon(Icons.ac_unit),
          );
          expect(find.byIcon(IconlyLight.paper_negative), findsNothing);
          expect(find.byIcon(Icons.ac_unit), findsOneWidget);
        },
      );

      testWidgets(
        'message を指定したら、指定した message が表示されていること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            message: 'post_message',
          );
          expect(find.text(l10nJa.postListEmpty), findsNothing);
          expect(find.text('post_message'), findsOneWidget);
        },
      );
    });
  });
}
