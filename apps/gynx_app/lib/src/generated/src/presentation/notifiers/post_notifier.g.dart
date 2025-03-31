// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../presentation/notifiers/post_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postNotifierHash() => r'725af69ff9fd1853ad1ee6e12985242932da6d07';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PostNotifier extends BuildlessAutoDisposeNotifier<VPost> {
  late final int postId;

  VPost build(
    int postId,
  );
}

/// See also [PostNotifier].
@ProviderFor(PostNotifier)
const postNotifierProvider = PostNotifierFamily();

/// See also [PostNotifier].
class PostNotifierFamily extends Family<VPost> {
  /// See also [PostNotifier].
  const PostNotifierFamily();

  /// See also [PostNotifier].
  PostNotifierProvider call(
    int postId,
  ) {
    return PostNotifierProvider(
      postId,
    );
  }

  @override
  PostNotifierProvider getProviderOverride(
    covariant PostNotifierProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postNotifierProvider';
}

/// See also [PostNotifier].
class PostNotifierProvider
    extends AutoDisposeNotifierProviderImpl<PostNotifier, VPost> {
  /// See also [PostNotifier].
  PostNotifierProvider(
    int postId,
  ) : this._internal(
          () => PostNotifier()..postId = postId,
          from: postNotifierProvider,
          name: r'postNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postNotifierHash,
          dependencies: PostNotifierFamily._dependencies,
          allTransitiveDependencies:
              PostNotifierFamily._allTransitiveDependencies,
          postId: postId,
        );

  PostNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  VPost runNotifierBuild(
    covariant PostNotifier notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PostNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostNotifierProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PostNotifier, VPost> createElement() {
    return _PostNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostNotifierProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostNotifierRef on AutoDisposeNotifierProviderRef<VPost> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _PostNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<PostNotifier, VPost>
    with PostNotifierRef {
  _PostNotifierProviderElement(super.provider);

  @override
  int get postId => (origin as PostNotifierProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
