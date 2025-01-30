import 'package:flutter/material.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/post_map_notifier.g.dart';

@Riverpod(keepAlive: true)
class PostMapNotifier extends _$PostMapNotifier {
  @override
  Map<int, VPost> build() {
    return {};
  }

  void put(VPost vPost) {
    state = {
      ...state,
      vPost.postId: vPost,
    };
  }

  void putByList(VPostList vPostList) {
    if (vPostList.isEmpty) {
      return;
    }
    state = {
      ...state,
      for (final vPost in vPostList.vPosts) vPost.postId: vPost,
    };
  }
}

@visibleForTesting
class PostMapNotifierMock extends _$PostMapNotifier
    with Mock
    implements PostMapNotifier {
  PostMapNotifierMock(this._vPostMap);

  PostMapNotifierMock.vPostList(VPostList vPostList)
      : _vPostMap = {
          for (final vPost in vPostList.vPosts) vPost.postId: vPost,
        };

  final Map<int, VPost> _vPostMap;

  @override
  Map<int, VPost> build() => _vPostMap;
}
