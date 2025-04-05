// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../presentation/notifiers/user_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDetailNotifierHash() =>
    r'6f00aa806831b65e422fc448d7b5924f740697de';

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

abstract class _$UserDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<VUserDetail> {
  late final String userId;

  FutureOr<VUserDetail> build(
    String userId,
  );
}

/// See also [UserDetailNotifier].
@ProviderFor(UserDetailNotifier)
const userDetailNotifierProvider = UserDetailNotifierFamily();

/// See also [UserDetailNotifier].
class UserDetailNotifierFamily extends Family<AsyncValue<VUserDetail>> {
  /// See also [UserDetailNotifier].
  const UserDetailNotifierFamily();

  /// See also [UserDetailNotifier].
  UserDetailNotifierProvider call(
    String userId,
  ) {
    return UserDetailNotifierProvider(
      userId,
    );
  }

  @override
  UserDetailNotifierProvider getProviderOverride(
    covariant UserDetailNotifierProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userDetailNotifierProvider';
}

/// See also [UserDetailNotifier].
class UserDetailNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserDetailNotifier, VUserDetail> {
  /// See also [UserDetailNotifier].
  UserDetailNotifierProvider(
    String userId,
  ) : this._internal(
          () => UserDetailNotifier()..userId = userId,
          from: userDetailNotifierProvider,
          name: r'userDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDetailNotifierHash,
          dependencies: UserDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              UserDetailNotifierFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<VUserDetail> runNotifierBuild(
    covariant UserDetailNotifier notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserDetailNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserDetailNotifier, VUserDetail>
      createElement() {
    return _UserDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<VUserDetail> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserDetailNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserDetailNotifier,
        VUserDetail> with UserDetailNotifierRef {
  _UserDetailNotifierProviderElement(super.provider);

  @override
  String get userId => (origin as UserDetailNotifierProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
