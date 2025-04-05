import 'package:app/src/domain/entities/t_post.dart';
import 'package:app/src/domain/entities/t_post_media.dart';
import 'package:app/src/domain/entities/t_user.dart';
import 'package:app/src/domain/entities/t_user_follow.dart';
import 'package:app/src/domain/entities/t_user_post_favorite.dart';
import 'package:app/src/domain/entities/t_user_profile.dart';
import 'package:app/src/domain/entities/t_user_timeline.dart';
import 'package:app/src/domain/entities/user.dart';
import 'package:app/src/domain/entities/v_post.dart';
import 'package:app/src/domain/entities/v_user.dart';
import 'package:app/src/domain/entities/v_user_detail.dart';
import 'package:app/src/domain/enums/media_type.dart';
import 'package:app/src/domain/enums/oauth_provider_type.dart';
import 'package:app/src/domain/enums/repost_type.dart';
import 'package:app/src/domain/enums/timeline_type.dart';
import 'package:app/src/domain/models/suite_user.dart';
import 'package:faker/faker.dart';

var _maxInt = 4294967296;

SuiteUser generateDummySuiteUser() => SuiteUser(
      vUserDetail: generateDummyVUserDetail(),
    );

User generateDummyUser() => User(
      id: faker.guid.guid(),
      displayName: faker.person.name(),
      email: faker.internet.email(),
      providers: [OAuthProviderType.google],
      isAnonymous: faker.randomGenerator.boolean(),
      createdAt: faker.date.dateTime(),
      lastSignInAt: faker.date.dateTime(),
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
      avatarUrl: faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserFollow generateDummyTUserFollow() => TUserFollow(
      id: faker.randomGenerator.integer(_maxInt),
      userId: faker.guid.guid(),
      followUserId: faker.guid.guid(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserPostFavorite generateDummyTUserPostFavorite() => TUserPostFavorite(
      id: faker.guid.guid(),
      userId: faker.guid.guid(),
      postId: faker.randomGenerator.integer(_maxInt),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TUserTimeline generateDummyTUserTimeline() => TUserTimeline(
      id: faker.guid.guid(),
      userId: faker.guid.guid(),
      type: TimelineType.follow,
      postId: faker.randomGenerator.integer(_maxInt),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TPost generateDummyTPost() => TPost(
      id: faker.randomGenerator.integer(_maxInt),
      userId: faker.guid.guid(),
      text: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

TPostMedia generateDummyTPostMedia() => TPostMedia(
      id: faker.guid.guid(),
      postId: faker.randomGenerator.integer(_maxInt),
      displayOrder: faker.randomGenerator.integer(_maxInt),
      type: MediaType.values[faker.randomGenerator.integer(2)],
      url: faker.image.loremPicsum(),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

VUser generateDummyVUser() => VUser(
      userId: faker.guid.guid(),
      gynxId: 'gynx_id',
      username: faker.person.name(),
      avatarUrl: faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
    );

VUserDetail generateDummyVUserDetail({
  List<VPost> latestPosts = const [],
  List<VPost> favoritePosts = const [],
}) =>
    VUserDetail(
      userId: faker.guid.guid(),
      gynxId: 'gynx_id',
      username: faker.person.name(),
      avatarUrl: faker.randomGenerator.boolean() ? faker.image.loremPicsum() : null,
      selfIntroduction: faker.lorem.sentence(),
      latestPosts: latestPosts,
      favoritePosts: favoritePosts,
      followCount: faker.randomGenerator.integer(100),
      followerCount: faker.randomGenerator.integer(100),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );

VPost generateDummyVPost({
  required int postId,
  RepostType repostType = RepostType.none,
  List<TPostMedia> medias = const [],
}) =>
    VPost(
      postId: postId,
      userId: faker.guid.guid(),
      originalPostId: repostType == RepostType.none ? null : faker.randomGenerator.integer(_maxInt),
      originalUserId: repostType == RepostType.none ? null : faker.guid.guid(),
      repostType: repostType,
      displayText: faker.lorem.sentence(),
      displayMedias: medias,
      quoteText: repostType == RepostType.quote ? faker.lorem.sentence() : null,
      quoteMedias: repostType == RepostType.quote ? medias : null,
      isReposted: faker.randomGenerator.boolean(),
      repostCount: faker.randomGenerator.integer(100),
      isFavorited: faker.randomGenerator.boolean(),
      favoriteCount: faker.randomGenerator.integer(100),
      createdAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      deletedAt: faker.randomGenerator.boolean() ? faker.date.dateTime() : null,
    );
