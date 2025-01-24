// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/dialogs/alert.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_app/src/presentation/pages/home/components/form_builder_image_picker.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_builder_image_picker_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoadingDialog>(),
  MockSpec<ImagePicker>(),
  MockSpec<FlutterVideoInfo>(),
  MockSpec<VideoData>(),
  MockSpec<Alert>(),
  MockSpec<XFile>(),
])
void main() {
  final l10nJa = L10nJa();
  final mockLoadingDialog = MockLoadingDialog();
  final mockImagePicker = MockImagePicker();
  final mockFlutterVideoInfo = MockFlutterVideoInfo();
  final mockAlert = MockAlert();

  setUpAll(() {
    GetIt.I.registerSingleton<LoadingDialog>(mockLoadingDialog);
    GetIt.I.registerSingleton<ImagePicker>(mockImagePicker);
    GetIt.I.registerSingleton<FlutterVideoInfo>(mockFlutterVideoInfo);
    GetIt.I.registerSingleton<Alert>(mockAlert);
  });

  tearDown(() {
    verifyNoMoreInteractions(mockLoadingDialog);
    verifyNoMoreInteractions(mockImagePicker);
    verifyNoMoreInteractions(mockFlutterVideoInfo);
    verifyNoMoreInteractions(mockAlert);
    reset(mockLoadingDialog);
    reset(mockImagePicker);
    reset(mockFlutterVideoInfo);
    reset(mockAlert);
  });

  group('FormBuilderImagePicker', () {
    Future<void> pumpWidget({
      required WidgetTester tester,
      required ValueChanged<List<XFile>> onChanged,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('ja'),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            home: Scaffold(
              body: FormBuilderImagePicker(
                onChanged: onChanged,
                showVideo: true,
              ),
            ),
          ),
        ),
      );
    }

    group('カメラ', () {
      group('正常系', () {
        group(
          'IconlyLight.camera をタップしたら、ImagePicker#pickImage の source が ImageSource.camera で呼ばれること',
          () {
            testWidgets('カメラ撮影', (tester) async {
              final mockXFile = MockXFile();
              when(
                mockImagePicker.pickImage(source: ImageSource.camera),
              ).thenAnswer((_) async => mockXFile);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  expect(xFiles, [mockXFile]);
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.camera));
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickImage(source: ImageSource.camera),
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets('カメラ撮影キャンセル', (tester) async {
              when(
                mockImagePicker.pickImage(source: ImageSource.camera),
              ).thenAnswer((_) async => null);
              await pumpWidget(
                tester: tester,
                onChanged: (_) => fail('unexpected call'),
              );
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.camera));
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickImage(source: ImageSource.camera),
                mockLoadingDialog.hide(),
              ]);
            });
          },
        );
      });
    });

    group('画像選択', () {
      group('正常系', () {
        group(
          'IconlyLight.image をタップしたら、ImagePicker#pickMultiImages が呼ばれること',
          () {
            testWidgets('画像選択', (tester) async {
              final mockXFile1 = MockXFile();
              final mockXFile2 = MockXFile();
              final mockXFile3 = MockXFile();
              final mockXFile4 = MockXFile();
              final mockXFiles = [
                mockXFile1,
                mockXFile2,
                mockXFile3,
                mockXFile4,
              ];
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => mockXFiles);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  expect(xFiles, mockXFiles);
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets('画像選択キャンセル', (tester) async {
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => []);
              await pumpWidget(
                tester: tester,
                onChanged: (_) => fail('unexpected call'),
              );
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
            });
          },
        );

        group(
          '1枚選択した後、再度 IconlyLight.image をタップしたら、ImagePicker#pickerMultiImage の limit が1減っていること',
          () {
            testWidgets('画像選択', (tester) async {
              final mockXFile1 = MockXFile();
              final mockXFile2 = MockXFile();
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => [mockXFile1]);
              when(
                mockImagePicker.pickMultiImage(limit: 3),
              ).thenAnswer((_) async => [mockXFile2]);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  if (onChangeCallCount == 1) {
                    expect(xFiles, [mockXFile1]);
                  } else {
                    expect(xFiles, [mockXFile1, mockXFile2]);
                  }
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 2);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 3),
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets('画像選択キャンセル', (tester) async {
              final mockXFile1 = MockXFile();
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => [mockXFile1]);
              when(
                mockImagePicker.pickMultiImage(limit: 3),
              ).thenAnswer((_) async => []);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  if (onChangeCallCount == 1) {
                    expect(xFiles, [mockXFile1]);
                  }
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 3),
                mockLoadingDialog.hide(),
              ]);
            });
          },
        );

        group(
          '3枚選択した後、再度 IconlyLight.image をタップしたら、ImagePicker#pickerImage が呼ばれること',
          () {
            testWidgets('画像選択', (tester) async {
              final mockXFile1 = MockXFile();
              final mockXFile2 = MockXFile();
              final mockXFile3 = MockXFile();
              final mockXFile4 = MockXFile();
              final mockXFiles = [
                mockXFile1,
                mockXFile2,
                mockXFile3,
              ];
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => mockXFiles);
              when(
                mockImagePicker.pickImage(source: ImageSource.gallery),
              ).thenAnswer((_) async => mockXFile4);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  if (onChangeCallCount == 1) {
                    expect(xFiles, mockXFiles);
                  } else {
                    expect(xFiles, [...mockXFiles, mockXFile4]);
                  }
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 2);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickImage(source: ImageSource.gallery),
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets('画像選択キャンセル', (tester) async {
              final mockXFile1 = MockXFile();
              final mockXFile2 = MockXFile();
              final mockXFile3 = MockXFile();
              final mockXFiles = [
                mockXFile1,
                mockXFile2,
                mockXFile3,
              ];
              when(
                mockImagePicker.pickMultiImage(limit: 4),
              ).thenAnswer((_) async => mockXFiles);
              when(
                mockImagePicker.pickImage(source: ImageSource.gallery),
              ).thenAnswer((_) async => null);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  if (onChangeCallCount == 1) {
                    expect(xFiles, mockXFiles);
                  }
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickMultiImage(limit: 4),
                mockLoadingDialog.hide(),
              ]);
              await tester.tap(find.byIcon(IconlyLight.image));
              await tester.pump();
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickImage(source: ImageSource.gallery),
                mockLoadingDialog.hide(),
              ]);
            });
          },
        );
      });
    });

    group('動画選択', () {
      group('正常系', () {
        group(
          'IconlyLight.video をタップしたら、ImagePicker#pickVideo の source が ImageSource.gallery 呼ばれること',
          () {
            testWidgets('動画選択', (tester) async {
              final mockXFile = MockXFile();
              final mockVideoData = MockVideoData();
              when(mockXFile.path).thenReturn('video-path');
              when(
                mockImagePicker.pickVideo(source: ImageSource.gallery),
              ).thenAnswer((_) async => mockXFile);
              when(mockFlutterVideoInfo.getVideoInfo('video-path'))
                  .thenAnswer((_) async => mockVideoData);
              when(mockVideoData.duration).thenReturn(140 * 1000);
              var onChangeCallCount = 0;
              await pumpWidget(
                tester: tester,
                onChanged: (xFiles) {
                  onChangeCallCount++;
                  expect(xFiles, [mockXFile]);
                },
              );
              expect(onChangeCallCount, 0);
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              verifyNoMoreInteractions(mockFlutterVideoInfo);
              await tester.tap(find.byIcon(IconlyLight.video));
              expect(onChangeCallCount, 1);
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickVideo(source: ImageSource.gallery),
                mockXFile.path,
                mockFlutterVideoInfo.getVideoInfo('video-path'),
                mockVideoData.duration,
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets('動画選択キャンセル', (tester) async {
              when(
                mockImagePicker.pickVideo(source: ImageSource.gallery),
              ).thenAnswer((_) async => null);
              await pumpWidget(
                tester: tester,
                onChanged: (_) => fail('unexpected call'),
              );
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              await tester.tap(find.byIcon(IconlyLight.video));
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickVideo(source: ImageSource.gallery),
                mockLoadingDialog.hide(),
              ]);
            });

            testWidgets(
              'FlutterVideoInfo#getVideoInfo で null が返ってきた場合は、onChanged が呼ばれないこと',
              (tester) async {
                final mockXFile = MockXFile();
                when(mockXFile.path).thenReturn('video-path');
                when(
                  mockImagePicker.pickVideo(source: ImageSource.gallery),
                ).thenAnswer((_) async => mockXFile);
                when(mockFlutterVideoInfo.getVideoInfo('video-path'))
                    .thenAnswer((_) async => null);
                await pumpWidget(
                  tester: tester,
                  onChanged: (_) => fail('unexpected call'),
                );
                verifyNoMoreInteractions(mockLoadingDialog);
                verifyNoMoreInteractions(mockImagePicker);
                await tester.tap(find.byIcon(IconlyLight.video));
                verifyInOrder([
                  mockLoadingDialog.show(),
                  mockImagePicker.pickVideo(source: ImageSource.gallery),
                  mockXFile.path,
                  mockFlutterVideoInfo.getVideoInfo('video-path'),
                  mockLoadingDialog.hide(),
                ]);
              },
            );
          },
        );
      });

      group('準正常系', () {
        group(
          '選択した動画が、140秒以上の場合は、Alert#showInfo に title:「${l10nJa.uploadVideoTooLongErrorTitle}」、text:「${l10nJa.uploadVideoTooLongErrorMessage(140)}」が渡されること',
          () {
            testWidgets('動画選択', (tester) async {
              final mockXFile = MockXFile();
              final mockVideoData = MockVideoData();
              when(mockXFile.path).thenReturn('video-path');
              when(
                mockImagePicker.pickVideo(source: ImageSource.gallery),
              ).thenAnswer((_) async => mockXFile);
              when(mockFlutterVideoInfo.getVideoInfo('video-path'))
                  .thenAnswer((_) async => mockVideoData);
              when(mockVideoData.duration).thenReturn(141 * 1000);
              await pumpWidget(
                tester: tester,
                onChanged: (_) => fail('unexpected call'),
              );
              verifyNoMoreInteractions(mockLoadingDialog);
              verifyNoMoreInteractions(mockImagePicker);
              verifyNoMoreInteractions(mockFlutterVideoInfo);
              verifyNoMoreInteractions(mockAlert);
              await tester.tap(find.byIcon(IconlyLight.video));
              verifyInOrder([
                mockLoadingDialog.show(),
                mockImagePicker.pickVideo(source: ImageSource.gallery),
                mockXFile.path,
                mockFlutterVideoInfo.getVideoInfo('video-path'),
                mockVideoData.duration,
                mockAlert.showInfo(
                  title: l10nJa.uploadVideoTooLongErrorTitle,
                  text: l10nJa.uploadVideoTooLongErrorMessage(140),
                ),
                mockLoadingDialog.hide(),
              ]);
            });
          },
        );
      });
    });
  });
}
