import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gynx_app/src/domain/models/post_id_list.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/presentation/notifiers/post_map_notifier.dart';

part '../../generated/src/presentation/notifiers/timeline_notifier_mixin.freezed.dart';

@freezed
class TimelineState with _$TimelineState {
  const TimelineState({
    this.isNoMorePost = false,
    this.postIdList = PostIdList.empty,
  });

  @override
  final bool isNoMorePost;
  @override
  final PostIdList postIdList;
}

mixin class TimelineNotifierMixin {
  // ignore: deprecated_member_use
  AutoDisposeAsyncNotifierProviderRef<TimelineState> get timelineNotifierRef =>
      throw UnimplementedError();

  AsyncValue<TimelineState> get timelineState => throw UnimplementedError();

  set timelineState(AsyncValue<TimelineState> value) =>
      throw UnimplementedError();

  Future<VPostList> fetchBySincePostId(int? sincePostId) =>
      throw UnimplementedError();

  Future<VPostList> fetchByMaxPostId(int? maxPostId) =>
      throw UnimplementedError();

  int get length => timelineState.value?.postIdList.length ?? 0;

  int? get maxPostId => timelineState.value?.postIdList.maxPostId;

  int? get minPostId => timelineState.value?.postIdList.minPostId;

  int getByIndex(int index) =>
      timelineState.requireValue.postIdList.getByIndex(index);

  /// 取得済みの投稿の中で一番最新の投稿より新しい投稿を取得する（未取得の場合は最新の投稿を取得する）
  Future<void> fetchNext() async {
    timelineState = const AsyncValue.loading();
    timelineState = await AsyncValue.guard(() async {
      final vPostList = await fetchBySincePostId(maxPostId);
      timelineNotifierRef
          .read(postMapNotifierProvider.notifier)
          .putByList(vPostList);
      return timelineState.requireValue.copyWith(
        postIdList: timelineState.requireValue.postIdList.addAll(
          vPostList.postIdList,
        ),
      );
    });
  }

  /// 取得済みの投稿の中で一番古い投稿より古い投稿を取得する
  Future<void> fetchPrevious() async {
    timelineState = const AsyncValue.loading();
    timelineState = await AsyncValue.guard(() async {
      final vPostList = await fetchByMaxPostId(minPostId);
      timelineNotifierRef
          .read(postMapNotifierProvider.notifier)
          .putByList(vPostList);
      return timelineState.requireValue.copyWith(
        isNoMorePost: vPostList.isEmpty,
        postIdList: timelineState.requireValue.postIdList.addAll(
          vPostList.postIdList,
        ),
      );
    });
  }

  void add(int postId) {
    timelineState = timelineState.maybeWhen(
      data: (value) => AsyncValue.data(
        value.copyWith(
          postIdList: value.postIdList.add(postId).sort(descending: true),
        ),
      ),
      orElse: () => AsyncValue.data(
        TimelineState(
          postIdList: PostIdList(
            [postId],
          ),
        ),
      ),
    );
  }
}
