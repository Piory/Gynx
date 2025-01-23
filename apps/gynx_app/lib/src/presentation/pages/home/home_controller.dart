import 'package:gynx_app/src/domain/enums/media_type.dart';
import 'package:gynx_app/src/domain/models/media.dart';
import 'package:gynx_app/src/domain/models/media_list.dart';
import 'package:gynx_app/src/domain/usecases/create_post_usecase.dart';
import 'package:gynx_app/src/presentation/notifiers/timeline_notifier.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeController {
  const HomeController(
    this._createPostUseCase,
  );

  final CreatePostUseCase _createPostUseCase;

  Future<void> createPost({
    required TimelineNotifier timelineNotifier,
    required String text,
    required List<String> mediaPaths,
  }) async {
    final vPost = await _createPostUseCase.execute(
      text: text,
      mediaList: MediaList(
        mediaPaths
            .map(
              (path) => Media(
                type: MediaType.image,
                url: path,
              ),
            )
            .toList(),
      ),
    );
    timelineNotifier.add(vPost);
  }
}
