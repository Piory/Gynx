// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gynx_app/src/presentation/components/elements/avatars/user_avatar.dart';
import 'package:gynx_app/src/presentation/components/elements/shimmers/shimmer.dart';

void main() {
  group('UserAvatar', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required bool isLoading,
      required String? avtarUrl,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: UserAvatar(
              isLoading: isLoading,
              avatarUrl: avtarUrl,
              radius: 8,
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('isLoading が true の場合は、 Shimmer が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          isLoading: true,
          avtarUrl: null,
        );
        expect(find.byType(Shimmer), findsOneWidget);
      });

      testWidgets(
        'isLoading が false かつ avtarUrl が null の場合は、CircleAvatar の foregroundImage が null であること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            isLoading: false,
            avtarUrl: null,
          );
          expect(find.byType(Shimmer), findsNothing);
          final circleAvatar =
              tester.widget<CircleAvatar>(find.byType(CircleAvatar));
          expect(circleAvatar.foregroundImage, isNull);
        },
      );

      testWidgets(
        'isLoading が false かつ avtarUrl が指定されているの場合は、CircleAvatar の foregroundImage が設定されていること',
        (tester) async {
          await pumpWidget(
            tester: tester,
            isLoading: false,
            avtarUrl: 'https://example.com/image.jpg',
          );
          expect(find.byType(Shimmer), findsNothing);
          final circleAvatar =
              tester.widget<CircleAvatar>(find.byType(CircleAvatar));
          expect(circleAvatar.foregroundImage, isNotNull);
        },
      );
    });
  });

  group('UserAvatar.loading', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required bool isLoading,
      required String? avtarUrl,
    }) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: UserAvatar.loading(
              radius: 8,
            ),
          ),
        ),
      );
    }

    //
    group('正常系', () {
      testWidgets('Shimmer が表示されること', (tester) async {
        await pumpWidget(
          tester: tester,
          isLoading: true,
          avtarUrl: null,
        );
        expect(find.byType(Shimmer), findsOneWidget);
      });
    });
  });
}
