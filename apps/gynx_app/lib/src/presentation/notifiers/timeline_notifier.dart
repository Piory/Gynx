import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/domain/entities/v_post.dart';
import 'package:gynx_app/src/domain/enums/timeline_type.dart';
import 'package:gynx_app/src/domain/models/v_post_list.dart';
import 'package:gynx_app/src/domain/usecases/fetch_post_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/src/presentation/notifiers/timeline_notifier.g.dart';

@riverpod
class TimelineNotifier extends _$TimelineNotifier {
  @override
  FutureOr<VPostList> build(TimelineType timelineType) async {
    final vPostList = await GetIt.I<FetchPostUseCase>().execute();
    return vPostList.sortPostId(descending: true);
  }

  void add(VPost vPost) {
    state = AsyncValue.data(
      state.requireValue.add(vPost).sortPostId(descending: true),
    );
  }

  void addAll(VPostList vPostList) {
    state = AsyncValue.data(
      state.requireValue.addAll(vPostList).sortPostId(descending: true),
    );
  }
}
