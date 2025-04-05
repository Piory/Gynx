// ignore_for_file: lines_longer_than_80_chars
import 'dart:io';

import 'package:app/src/application/interactors/update_user_profile_interactor.dart';
import 'package:app/src/domain/entities/user.dart';
import 'package:app/src/domain/enums/storage_type.dart';
import 'package:app/src/domain/exceptions/user_not_signed_in_exception.dart';
import 'package:app/src/domain/generators/uuid_generator.dart';
import 'package:app/src/domain/repositories/auth_repository.dart';
import 'package:app/src/domain/repositories/storage_repository.dart';
import 'package:app/src/domain/repositories/t_user_profile_repository.dart';
import 'package:app/src/domain/repositories/t_user_repository.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../data/dummy_data_generator.dart';
import 'update_user_profile_interactor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<File>(),
  MockSpec<User>(),
  MockSpec<UuidGenerator>(),
  MockSpec<AuthRepository>(),
  MockSpec<StorageRepository>(),
  MockSpec<TUserRepository>(),
  MockSpec<TUserProfileRepository>(),
])
void main() {
  final gynxId = faker.guid.guid();
  final username = faker.person.name();
  final mockFile = MockFile();
  final selfIntroduction = faker.lorem.sentence();
  final userId = faker.guid.guid();
  final filename = faker.guid.guid();
  final uploadedAvatarUrl = faker.image.loremPicsum();
  final tUser = generateDummyTUser().copyWith(
    id: userId,
  );
  final tUserProfile = generateDummyTUserProfile().copyWith(
    userId: userId,
    avatarUrl: faker.image.loremPicsum(),
  );
  final mockUser = MockUser();
  final mockUuidGenerator = MockUuidGenerator();
  final mockAuthRepository = MockAuthRepository();
  final mockStorageRepository = MockStorageRepository();
  final mockTUserRepository = MockTUserRepository();
  final mockTUserProfileRepository = MockTUserProfileRepository();
  final interactor = UpdateUserProfileInteractor(
    mockUuidGenerator,
    mockAuthRepository,
    mockStorageRepository,
    mockTUserRepository,
    mockTUserProfileRepository,
  );

  tearDown(() {
    verifyNoMoreInteractions(mockUser);
    verifyNoMoreInteractions(mockUuidGenerator);
    verifyNoMoreInteractions(mockAuthRepository);
    verifyNoMoreInteractions(mockStorageRepository);
    verifyNoMoreInteractions(mockTUserRepository);
    verifyNoMoreInteractions(mockTUserProfileRepository);
    reset(mockUser);
    reset(mockUuidGenerator);
    reset(mockAuthRepository);
    reset(mockStorageRepository);
    reset(mockTUserRepository);
    reset(mockTUserProfileRepository);
  });

  group('正常系', () {
    test(
      '何も変更項目がない場合は、何も処理が行われないこと',
      () async {
        await interactor.execute(
          gynxId: null,
          username: null,
          avatarImage: null,
          isDeleteAvatar: false,
          selfIntroduction: null,
        );
        verifyZeroInteractions(mockUser);
        verifyZeroInteractions(mockUuidGenerator);
        verifyZeroInteractions(mockAuthRepository);
        verifyZeroInteractions(mockStorageRepository);
        verifyZeroInteractions(mockTUserRepository);
        verifyZeroInteractions(mockTUserProfileRepository);
      },
    );

    test('すべての項目の更新できること', () async {
      when(mockAuthRepository.currentUser).thenReturn(mockUser);
      when(mockUser.id).thenReturn(userId);
      when(mockTUserRepository.findByPrimaryKey(any)).thenAnswer((_) async => tUser);
      when(
        mockTUserRepository.updateByPrimaryKey(
          id: userId,
          gynxId: gynxId,
        ),
      ).thenAnswer((_) async {});
      when(mockUuidGenerator.generate()).thenAnswer((_) => filename);
      when(mockTUserProfileRepository.findByPrimaryKey(any)).thenAnswer((_) async => tUserProfile);
      when(
        mockStorageRepository.deleteFile(
          storageType: StorageType.users,
          path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
        ),
      ).thenAnswer((_) async {});
      when(
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: username,
          avatarUrl: uploadedAvatarUrl,
          selfIntroduction: selfIntroduction,
        ),
      ).thenAnswer((_) async {});
      when(
        mockStorageRepository.uploadFile(
          storageType: StorageType.users,
          path: '$userId/avatars',
          filename: filename,
          file: mockFile,
        ),
      ).thenAnswer((_) async => uploadedAvatarUrl);
      await interactor.execute(
        gynxId: gynxId,
        username: username,
        avatarImage: mockFile,
        isDeleteAvatar: false,
        selfIntroduction: selfIntroduction,
      );
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockUser.id,
        mockTUserRepository.findByPrimaryKey(userId),
        mockTUserRepository.updateByPrimaryKey(
          id: userId,
          gynxId: gynxId,
        ),
        mockUuidGenerator.generate(),
        mockStorageRepository.uploadFile(
          storageType: StorageType.users,
          path: '$userId/avatars',
          filename: filename,
          file: mockFile,
        ),
        mockTUserProfileRepository.findByPrimaryKey(userId),
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: username,
          avatarUrl: uploadedAvatarUrl,
          selfIntroduction: selfIntroduction,
        ),
        mockStorageRepository.deleteFile(
          storageType: StorageType.users,
          path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
        ),
      ]);
    });

    test(
      'isDeleteAvatar を true にしたら、TUserProfileRepository#updateByPrimaryKeySelective の isDeleteAvatar に true が渡されること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(mockUser);
        when(mockUser.id).thenReturn(userId);
        when(mockTUserProfileRepository.findByPrimaryKey(any)).thenAnswer((_) async => tUserProfile);
        when(
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: null,
            isDeleteAvatarUrl: true,
            selfIntroduction: null,
          ),
        ).thenAnswer((_) async {});
        when(
          mockStorageRepository.deleteFile(
            storageType: StorageType.users,
            path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
          ),
        ).thenAnswer((_) async {});
        await interactor.execute(
          gynxId: null,
          username: null,
          avatarImage: null,
          isDeleteAvatar: true,
          selfIntroduction: null,
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockUser.id,
          mockTUserProfileRepository.findByPrimaryKey(userId),
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: null,
            isDeleteAvatarUrl: true,
            selfIntroduction: null,
          ),
          mockStorageRepository.deleteFile(
            storageType: StorageType.users,
            path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
          ),
        ]);
      },
    );

    test(
      'avatarImage の指定 & isDeleteAvatar を true にしても、TUserProfileRepository#updateByPrimaryKeySelective の isDeleteAvatar に true が渡されること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(mockUser);
        when(mockUser.id).thenReturn(userId);
        when(mockTUserProfileRepository.findByPrimaryKey(any)).thenAnswer((_) async => tUserProfile);
        when(
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: null,
            isDeleteAvatarUrl: true,
            selfIntroduction: null,
          ),
        ).thenAnswer((_) async {});
        when(
          mockStorageRepository.deleteFile(
            storageType: StorageType.users,
            path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
          ),
        ).thenAnswer((_) async {});
        await interactor.execute(
          gynxId: null,
          username: null,
          avatarImage: mockFile,
          isDeleteAvatar: true,
          selfIntroduction: null,
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockUser.id,
          mockTUserProfileRepository.findByPrimaryKey(userId),
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: null,
            isDeleteAvatarUrl: true,
            selfIntroduction: null,
          ),
          mockStorageRepository.deleteFile(
            storageType: StorageType.users,
            path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
          ),
        ]);
      },
    );

    test(
      'gynxId のみ更新する場合、TUserProfile 関連の処理は行われないこと',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(mockUser);
        when(mockUser.id).thenReturn(userId);
        when(mockTUserRepository.findByPrimaryKey(userId)).thenAnswer((_) async => tUser);
        when(
          mockTUserRepository.updateByPrimaryKey(
            id: userId,
            gynxId: gynxId,
          ),
        ).thenAnswer((_) async {});
        await interactor.execute(
          gynxId: gynxId,
          username: null,
          avatarImage: null,
          isDeleteAvatar: false,
          selfIntroduction: null,
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockUser.id,
          mockTUserRepository.findByPrimaryKey(userId),
          mockTUserRepository.updateByPrimaryKey(
            id: userId,
            gynxId: gynxId,
          ),
        ]);
      },
    );

    test('ユーザ名のみ更新する場合、TUser 関連とストレージ関連の処理は行われないこと', () async {
      when(mockAuthRepository.currentUser).thenReturn(mockUser);
      when(mockUser.id).thenReturn(userId);
      when(mockTUserProfileRepository.findByPrimaryKey(userId)).thenAnswer((_) async => tUserProfile);
      when(
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: username,
          avatarUrl: null,
          selfIntroduction: null,
        ),
      ).thenAnswer((_) async {});
      await interactor.execute(
        gynxId: null,
        username: username,
        avatarImage: null,
        isDeleteAvatar: false,
        selfIntroduction: null,
      );
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockUser.id,
        mockTUserProfileRepository.findByPrimaryKey(userId),
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: username,
          avatarUrl: null,
          selfIntroduction: null,
        ),
      ]);
    });

    test('アバター画像のみ更新する場合、TUser 関連の処理は行われないこと', () async {
      when(mockAuthRepository.currentUser).thenReturn(mockUser);
      when(mockUser.id).thenReturn(userId);
      when(mockUuidGenerator.generate()).thenAnswer((_) => filename);
      when(
        mockStorageRepository.uploadFile(
          storageType: StorageType.users,
          path: '$userId/avatars',
          filename: filename,
          file: mockFile,
        ),
      ).thenAnswer((_) async => uploadedAvatarUrl);
      when(mockTUserProfileRepository.findByPrimaryKey(userId)).thenAnswer((_) async => tUserProfile);
      when(
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: null,
          avatarUrl: uploadedAvatarUrl,
          selfIntroduction: null,
        ),
      ).thenAnswer((_) async {});
      when(
        mockStorageRepository.deleteFile(
          storageType: StorageType.users,
          path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
        ),
      ).thenAnswer((_) async {});
      await interactor.execute(
        gynxId: null,
        username: null,
        avatarImage: mockFile,
        isDeleteAvatar: false,
        selfIntroduction: null,
      );
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockUser.id,
        mockUuidGenerator.generate(),
        mockStorageRepository.uploadFile(
          storageType: StorageType.users,
          path: '$userId/avatars',
          filename: filename,
          file: mockFile,
        ),
        mockTUserProfileRepository.findByPrimaryKey(userId),
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: null,
          avatarUrl: uploadedAvatarUrl,
          selfIntroduction: null,
        ),
        mockStorageRepository.deleteFile(
          storageType: StorageType.users,
          path: '$userId/avatars/${tUserProfile.avatarUrl!.split('/').last}',
        ),
      ]);
    });

    test(
      'アバター画像のみ更新する場合でも、TUserProfile.avatarUrl が設定されていない場合は、StorageRepository#deleteFile も呼ばれないこと',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(mockUser);
        when(mockUser.id).thenReturn(userId);
        when(mockUuidGenerator.generate()).thenAnswer((_) => filename);
        when(
          mockStorageRepository.uploadFile(
            storageType: StorageType.users,
            path: '$userId/avatars',
            filename: filename,
            file: mockFile,
          ),
        ).thenAnswer((_) async => uploadedAvatarUrl);
        when(mockTUserProfileRepository.findByPrimaryKey(userId)).thenAnswer((_) async => tUserProfile.copyWith(
              avatarUrl: null,
            ));
        when(
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: uploadedAvatarUrl,
            selfIntroduction: null,
          ),
        ).thenAnswer((_) async {});
        await interactor.execute(
          gynxId: null,
          username: null,
          avatarImage: mockFile,
          isDeleteAvatar: false,
          selfIntroduction: null,
        );
        verifyInOrder([
          mockAuthRepository.currentUser,
          mockUser.id,
          mockUuidGenerator.generate(),
          mockStorageRepository.uploadFile(
            storageType: StorageType.users,
            path: '$userId/avatars',
            filename: filename,
            file: mockFile,
          ),
          mockTUserProfileRepository.findByPrimaryKey(userId),
          mockTUserProfileRepository.updateByPrimaryKeySelective(
            userId: userId,
            username: null,
            avatarUrl: uploadedAvatarUrl,
            selfIntroduction: null,
          ),
        ]);
      },
    );

    test('自己紹介のみ更新する場合、TUser 関連とストレージ関連の処理は行われないこと', () async {
      when(mockAuthRepository.currentUser).thenReturn(mockUser);
      when(mockUser.id).thenReturn(userId);
      when(mockTUserProfileRepository.findByPrimaryKey(userId)).thenAnswer((_) async => tUserProfile);
      when(
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: null,
          avatarUrl: null,
          selfIntroduction: selfIntroduction,
        ),
      ).thenAnswer((_) async {});
      await interactor.execute(
        gynxId: null,
        username: null,
        avatarImage: null,
        isDeleteAvatar: false,
        selfIntroduction: selfIntroduction,
      );
      verifyInOrder([
        mockAuthRepository.currentUser,
        mockUser.id,
        mockTUserProfileRepository.findByPrimaryKey(userId),
        mockTUserProfileRepository.updateByPrimaryKeySelective(
          userId: userId,
          username: null,
          avatarUrl: null,
          selfIntroduction: selfIntroduction,
        ),
      ]);
    });
  });

  group('準正常系', () {
    test(
      'AuthRepository#currentUser で null が返ってきた場合は、UserNotSignedInException が発生すること',
      () async {
        when(mockAuthRepository.currentUser).thenReturn(null);
        await expectLater(
          interactor.execute(
            gynxId: gynxId,
            username: username,
            avatarImage: mockFile,
            isDeleteAvatar: false,
            selfIntroduction: selfIntroduction,
          ),
          throwsA(const TypeMatcher<UserNotSignedInException>()),
        );
        verify(mockAuthRepository.currentUser);
      },
    );
  });
}
