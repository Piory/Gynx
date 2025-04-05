import 'package:flutter/material.dart';

abstract class FirstClassCollectionForMap<K, V> {
  @protected
  Map<K, V> get values;

  V? operator [](K key) => values[key];

  V getRequired(K key) => values[key]!;

  bool get isEmpty => values.isEmpty;

  bool get isNotEmpty => values.isNotEmpty;

  int get length => values.length;

  bool containsKey(K key) => values.containsKey(key);
}
