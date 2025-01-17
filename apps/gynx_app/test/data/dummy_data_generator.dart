import 'package:faker/faker.dart';
import 'package:gynx_app/src/domain/entities/t_post.dart';
import 'package:gynx_app/src/domain/entities/t_post_media.dart';
import 'package:gynx_app/src/domain/entities/t_user.dart';
import 'package:gynx_app/src/domain/entities/t_user_follow.dart';
import 'package:gynx_app/src/domain/entities/t_user_post_favorite.dart';
import 'package:gynx_app/src/domain/entities/t_user_profile.dart';
import 'package:gynx_app/src/domain/entities/t_user_timeline.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/entities/v_user_detail.dart';
import 'package:gynx_app/src/domain/enums/media_type.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/suite_user.dart';

SuiteUser generateDummySuiteUser() => SuiteUser(
      tUser: generateDummyTUser(),
      tUserProfile: generateDummyTUserProfile(),
    );

TUser generateDummyTUser() => TUser(
      id: faker.guid.guid(),
      gynxId: 'gynx_id',
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserProfile generateDummyTUserProfile() => TUserProfile(
      userId: faker.guid.guid(),
      username: faker.person.name(),
      avatarUrl:
          faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserFollow generateDummyTUserFollow() => TUserFollow(
      id: faker.randomGenerator.integer(4),
      userId: faker.guid.guid(),
      followUserId: faker.guid.guid(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserPostFavorite generateDummyTUserPostFavorite() => TUserPostFavorite(
      id: faker.guid.guid(),
      userId: faker.guid.guid(),
      postId: faker.randomGenerator.integer(4),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserTimeline generateDummyTUserTimeline() => TUserTimeline(
      id: faker.guid.guid(),
      userId: faker.guid.guid(),
      type: TimelineType.follow,
      postId: faker.randomGenerator.integer(4),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TPost generateDummyTPost() => TPost(
      id: faker.randomGenerator.integer(4),
      userId: faker.guid.guid(),
      text: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TPostMedia generateDummyTPostMedia() => TPostMedia(
      id: faker.guid.guid(),
      postId: faker.randomGenerator.integer(4),
      displayOrder: faker.randomGenerator.integer(4),
      type: MediaType.values[faker.randomGenerator.integer(2)],
      url: faker.image.loremPicsum(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

VUserDetail generateDummyVUserDetail({
  List<VPost> latestPosts = const [],
}) =>
    VUserDetail(
      userId: faker.guid.guid(),
      gynxId: faker.guid.guid(),
      username: faker.person.name(),
      avatarUrl:
          faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction: faker.lorem.sentence(),
      latestPosts: latestPosts,
      followCount: faker.randomGenerator.integer(100),
      followerCount: faker.randomGenerator.integer(100),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

VPost generateDummyVPost({
  required int postId,
  VPost? repost,
  List<TPostMedia> medias = const [],
}) =>
    VPost(
      postId: postId,
      userId: faker.guid.guid(),
      repost: repost,
      text: repost == null ? faker.guid.guid() : null,
      medias: medias,
      avatarUrl: faker.image.loremPicsum(),
      selfIntroduction: faker.guid.guid(),
      followCount: faker.randomGenerator.integer(100),
      followerCount: faker.randomGenerator.integer(100),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );
