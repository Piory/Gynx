import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:get_it/get_it.dart';
import 'package:gynx_app/src/presentation/dialogs/alert.dart';
import 'package:gynx_app/src/presentation/dialogs/loading_dialog.dart';
import 'package:gynx_constants/gynx_constants.dart';
import 'package:gynx_l10n/gynx_l10n.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class FormBuilderImagePicker extends StatelessWidget {
  const FormBuilderImagePicker({
    super.key,
    this.showVideo = false,
    this.textFieldFocusNode,
    required this.onChanged,
  });

  final bool showVideo;
  final FocusNode? textFieldFocusNode;
  final ValueChanged<List<XFile>> onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<XFile>>(
      name: 'medias',
      initialValue: const [],
      onChanged: (value) {
        if (value == null || value.isEmpty) {
          return;
        }
        onChanged(value);
      },
      focusNode: textFieldFocusNode,
      builder: (field) {
        final selectedMediaCount = field.value!.length;
        return Row(
          children: [
            IconButton(
              onPressed: () => _onPressed(
                selectedMediaCount: selectedMediaCount,
                pick: () => _pickImage(
                  source: ImageSource.camera,
                  field: field,
                ),
              ),
              icon: const Icon(
                IconlyLight.camera,
                size: 26,
              ),
            ),
            IconButton(
              onPressed: () => _onPressed(
                selectedMediaCount: selectedMediaCount,
                pick: () => _pickImages(
                  field: field,
                  selectedMediaCount: selectedMediaCount,
                ),
              ),
              icon: const Icon(
                IconlyLight.image,
                size: 26,
              ),
            ),
            if (showVideo)
              IconButton(
                onPressed: () => _onPressed(
                  selectedMediaCount: selectedMediaCount,
                  pick: () => _pickVideo(
                    field: field,
                    l10n: context.l10n,
                    source: ImageSource.gallery,
                  ),
                ),
                icon: const Icon(
                  IconlyLight.video,
                  size: 26,
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _onPressed({
    required int selectedMediaCount,
    required Future<void> Function() pick,
  }) async {
    if (selectedMediaCount >= Constant.maxMediaCount) {
      return;
    }
    // テキストフィールドのフォーカスにフォーカスした状態で、画像選択を行うと、
    // IconButton の表示が崩れるため、フォーカス中は一度フォーカスを行い、画像選択完了後に再度フォーカスを行う
    final hasFocus = textFieldFocusNode?.hasFocus ?? false;
    if (hasFocus) {
      textFieldFocusNode?.unfocus();
    }
    final loadingDialog = GetIt.I<LoadingDialog>();
    try {
      loadingDialog.show();
      await pick();
    } finally {
      loadingDialog.hide();
      if (hasFocus) {
        textFieldFocusNode?.requestFocus();
      }
    }
  }

  Future<void> _pickImage({
    required ImageSource source,
    required FormFieldState<List<XFile>> field,
  }) async {
    final image = await GetIt.I<ImagePicker>().pickImage(source: source);
    if (image == null) {
      return;
    }
    field.didChange([
      ...field.value!,
      image,
    ]);
  }

  Future<void> _pickImages({
    required FormFieldState<List<XFile>> field,
    required int selectedMediaCount,
  }) async {
    final limit = Constant.maxMediaCount - selectedMediaCount;
    if (limit == 1) {
      await _pickImage(
        source: ImageSource.gallery,
        field: field,
      );
    } else {
      final selectedMedias =
          await GetIt.I<ImagePicker>().pickMultiImage(limit: limit);
      if (selectedMedias.isEmpty) {
        return;
      }
      field.didChange([
        ...field.value!,
        ...selectedMedias,
      ]);
    }
  }

  Future<void> _pickVideo({
    required L10n l10n,
    required ImageSource source,
    required FormFieldState<List<XFile>> field,
  }) async {
    final imagePicker = GetIt.I<ImagePicker>();
    final video = await imagePicker.pickVideo(
      source: source,
    );
    if (video == null) {
      return;
    }
    final info = await GetIt.I<FlutterVideoInfo>().getVideoInfo(video.path);
    if (info == null) {
      return;
    }
    // 2分20秒以上の動画はアップロードできない
    final videoDuration = Duration(milliseconds: info.duration!.toInt());
    if (videoDuration.inSeconds > Constant.maxVideoSeconds) {
      await GetIt.I<Alert>().showInfo(
        title: l10n.uploadVideoTooLongErrorTitle,
        text: l10n.uploadVideoTooLongErrorMessage(Constant.maxVideoSeconds),
      );
      return;
    }
    field.didChange([
      ...field.value!,
      video,
    ]);
  }
}
