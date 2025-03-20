// ignore_for_file: lines_longer_than_80_chars
import 'package:faker/faker.dart';
import 'package:gynx_app/src/application/interactors/create_post_interactor.dart';
import 'package:gynx_app/src/domain/enums/media_type.dart';
import 'package:gynx_app/src/domain/enums/storage_type.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:gynx_app/src/domain/generators/uuid_generator.dart';
import 'package:gynx_app/src/domain/models/media.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';
import 'package:gynx_app/src/domain/repositories/auth_repository.dart';
import 'package:gynx_app/src/domain/repositories/post_repository.dart';
import 'package:gynx_app/src/domain/repositories/storage_repository.dart';
import 'package:gynx_app/src/domain/repositories/v_post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'create_post_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UuidGenerator>(),
  MockSpec<AuthRepository>(),
  MockSpec<StorageRepository>(),
  MockSpec<PostRepository>(),
  MockSpec<VPostRepository>(),
])
void main() {
  final mockUuidGenerator = MockUuidGenerator();
  final mockAuthRepository = MockAuthRepository();
  final mockStorageRepository = MockStorageRepository();
  final mockPostRepository = MockPostRepository();
  final mockVPostRepository = MockVPostRepository();
  final interactor = CreatePostInteractor(
    mockUuidGenerator,
    mockAuthRepository,
    mockStorageRepository,
    mockPostRepository,
    mockVPostRepository,
  );
  final user = generateDummyUser();
  const postId = 12345;

  tearDown(() {
    verifyNoMoreInteractions(mockUuidGenerator);
    verifyNoMoreInteractions(mockAuthRepository);
    verifyNoMoreInteractions(mockStorageRepository);
    verifyNoMoreInteractions(mockPostRepository);
    verifyNoMoreInteractions(mockVPostRepository);
    reset(mockUuidGenerator);
    reset(mockAuthRepository);
    reset(mockStorageRepository);
    reset(mockPostRepository);
    reset(mockVPostRepository);
  });

  group('正常系', () {
    test('投稿文のみの投稿が正常に作成されること', () async {
      const mediaList = MediaList.empty;
      final vPost = generateDummyVPost(postId: postId);
      when(mockAuthRepository.currentUser).thenReturn(user);
      when(
        mockPostRepository.create(
          user.id,
          TimelineType.follow,
          vPost.text,
          mediaList,
        ),
      ).thenAnswer((_) async => postId);
      when(mockVPostRepository.findByPostId(postId)).thenAnswer(
        (_) async => vPost,
      );
      expect(
        await interactor.execute(
          text: vPost.text!,
          mediaList: mediaList,
        ),
        vPost,
      );
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockPostRepository.create(
          user.id,
          TimelineType.follow,
          vPost.text,
          mediaList,
        ),
        mockVPostRepository.findByPostId(postId),
      ]);
    });

    test('メディア付きの投稿が正常に作成されること', () async {
      const text = 'post_text';
      const imageMedia = Media(
        type: MediaType.image,
        url: 'https://example.com/image.jpg',
      );
      const videoMedia = Media(
        type: MediaType.video,
        url: 'https://example.com/video.mp4',
      );
      const mediaList = MediaList([imageMedia, videoMedia]);
      when(mockAuthRepository.currentUser).thenReturn(user);
      final uuid1 = faker.guid.guid();
      final uuid2 = faker.guid.guid();
      var uuidGenerateCallCount = 0;
      when(mockUuidGenerator.generate()).thenAnswer((i) {
        final uuid = [uuid1, uuid2][uuidGenerateCallCount];
        uuidGenerateCallCount++;
        return uuid;
      });
      const uploadedUrl1 = 'https://uploaded.com/image.jpg';
      when(
        mockStorageRepository.uploadFile(
          storageType: StorageType.posts,
          path: 'medias',
          filename: uuid1,
          file: anyNamed('file'),
        ),
      ).thenAnswer((_) async => uploadedUrl1);
      const uploadedUrl2 = 'https://uploaded.com/video.mp4';
      when(
        mockStorageRepository.uploadFile(
          storageType: StorageType.posts,
          path: 'medias',
          filename: uuid2,
          file: anyNamed('file'),
        ),
      ).thenAnswer((_) async => uploadedUrl2);
      final uploadedMediaList = MediaList([
        imageMedia.copyWith(url: uploadedUrl1),
        videoMedia.copyWith(url: uploadedUrl2),
      ]);
      when(
        mockPostRepository.create(
          user.id,
          TimelineType.follow,
          text,
          uploadedMediaList,
        ),
      ).thenAnswer((_) async => postId);
      final vPost = generateDummyVPost(
        postId: postId,
        medias: [
          generateDummyTPostMedia().copyWith(
            type: imageMedia.type,
            url: uploadedUrl1,
          ),
          generateDummyTPostMedia().copyWith(
            type: videoMedia.type,
            url: uploadedUrl2,
          ),
        ],
      );
      when(mockVPostRepository.findByPostId(postId)).thenAnswer(
        (_) async => vPost,
      );
      final actual = await interactor.execute(
        text: text,
        mediaList: mediaList,
      );
      expect(actual, vPost);
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockUuidGenerator.generate(),
        mockStorageRepository.uploadFile(
          storageType: StorageType.posts,
          path: 'medias',
          filename: uuid1,
          file: anyNamed('file'),
        ),
        mockUuidGenerator.generate(),
        mockStorageRepository.uploadFile(
          storageType: StorageType.posts,
          path: 'medias',
          filename: uuid2,
          file: anyNamed('file'),
        ),
        mockPostRepository.create(
          user.id,
          TimelineType.follow,
          text,
          uploadedMediaList,
        ),
        mockVPostRepository.findByPostId(postId),
      ]);
    });
  });

  group('純正常系', () {
    test(
      'AuthRepository#currentUser が null の場合、UserNotSignedInException が throw されること',
      () {
        when(mockAuthRepository.currentUser).thenReturn(null);
        expect(
          () => interactor.execute(
            text: faker.lorem.sentence(),
            mediaList: MediaList.empty,
          ),
          throwsA(isA<UserNotSignedInException>()),
        );
        verify(mockAuthRepository.currentUser);
      },
    );
  });
}
