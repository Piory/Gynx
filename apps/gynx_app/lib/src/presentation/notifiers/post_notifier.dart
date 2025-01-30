import 'package:flutter/material.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/post_notifier.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  @override
  VPost build(int postId) {
    return ref.watch(postMapNotifierProvider.select((value) => value[postId]!));
  }
}

@visibleForTesting
class PostNotifierMock extends _$PostNotifier
    with Mock
    implements PostNotifier {
  PostNotifierMock(this._vPost);

  final VPost _vPost;

  @override
  VPost build(int postId) => _vPost;
}
