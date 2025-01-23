// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../presentation/notifiers/timeline_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timelineNotifierHash() => r'87d5b39d48ef3a8e49619acfa35747c5c4b45d3e';

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

abstract class _$TimelineNotifier
    extends BuildlessAutoDisposeAsyncNotifier<VPostList> {
  late final TimelineType timelineType;

  FutureOr<VPostList> build(
    TimelineType timelineType,
  );
}

/// See also [TimelineNotifier].
@ProviderFor(TimelineNotifier)
const timelineNotifierProvider = TimelineNotifierFamily();

/// See also [TimelineNotifier].
class TimelineNotifierFamily extends Family<AsyncValue<VPostList>> {
  /// See also [TimelineNotifier].
  const TimelineNotifierFamily();

  /// See also [TimelineNotifier].
  TimelineNotifierProvider call(
    TimelineType timelineType,
  ) {
    return TimelineNotifierProvider(
      timelineType,
    );
  }

  @override
  TimelineNotifierProvider getProviderOverride(
    covariant TimelineNotifierProvider provider,
  ) {
    return call(
      provider.timelineType,
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
  String? get name => r'timelineNotifierProvider';
}

/// See also [TimelineNotifier].
class TimelineNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TimelineNotifier, VPostList> {
  /// See also [TimelineNotifier].
  TimelineNotifierProvider(
    TimelineType timelineType,
  ) : this._internal(
          () => TimelineNotifier()..timelineType = timelineType,
          from: timelineNotifierProvider,
          name: r'timelineNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$timelineNotifierHash,
          dependencies: TimelineNotifierFamily._dependencies,
          allTransitiveDependencies:
              TimelineNotifierFamily._allTransitiveDependencies,
          timelineType: timelineType,
        );

  TimelineNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timelineType,
  }) : super.internal();

  final TimelineType timelineType;

  @override
  FutureOr<VPostList> runNotifierBuild(
    covariant TimelineNotifier notifier,
  ) {
    return notifier.build(
      timelineType,
    );
  }

  @override
  Override overrideWith(TimelineNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TimelineNotifierProvider._internal(
        () => create()..timelineType = timelineType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timelineType: timelineType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TimelineNotifier, VPostList>
      createElement() {
    return _TimelineNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimelineNotifierProvider &&
        other.timelineType == timelineType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timelineType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TimelineNotifierRef on AutoDisposeAsyncNotifierProviderRef<VPostList> {
  /// The parameter `timelineType` of this provider.
  TimelineType get timelineType;
}

class _TimelineNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TimelineNotifier, VPostList>
    with TimelineNotifierRef {
  _TimelineNotifierProviderElement(super.provider);

  @override
  TimelineType get timelineType =>
      (origin as TimelineNotifierProvider).timelineType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
