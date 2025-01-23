import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FlutterVideoInfoModule {
  @singleton
  FlutterVideoInfo get flutterVideoInfo => FlutterVideoInfo();
}
