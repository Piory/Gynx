import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/timeline_notifier.g.dart';

@riverpod
class TimelineNotifier extends _$TimelineNotifier with TimelineNotifierMixin {
  @override
  FutureOr<TimelineState> build() => const TimelineState();

  @override
  Ref<AsyncValue<TimelineState>> get timelineNotifierRef => ref;

  @override
  AsyncValue<TimelineState> get timelineState => state;

  @override
  set timelineState(AsyncValue<TimelineState> value) => state = value;

  @override
  Future<VPostList> fetchBySincePostId(int? sincePostId) =>
      GetIt.I<FetchPostUseCase>().execute(
        sincePostId: maxPostId,
      );

  @override
  Future<VPostList> fetchByMaxPostId(int? maxPostId) =>
      GetIt.I<FetchPostUseCase>().execute(
        maxPostId: minPostId,
      );
}
