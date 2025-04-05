import 'package:flutter/material.dart';

abstract class FirstClassCollectionForList<E, L> {
  @protected
  List<E> get values;

  @protected
  L toList(Iterable<E> list);

  E operator [](int index) => values[index];

  bool get isEmpty => values.isEmpty;

  bool get isNotEmpty => values.isNotEmpty;

  int get length => values.length;

  void forEach(void Function(E) f) => values.forEach(f);

  L where(bool Function(E) f) => toList(values.where(f));

  Iterable<R> map<R>(R Function(E) f) => values.map(f);

  R to<R>(R Function(L) f) => f(this as L);
}
