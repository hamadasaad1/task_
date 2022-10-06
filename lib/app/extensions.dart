

import 'dart:ffi';

import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}


extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return Constants.zeroDec;
    } else {
      return this!;
    }
  }}



extension NonNullBoolean on bool? {
  bool orBool() {
    if (this == null) {
    return  Constants.isEmpty;
    } else {
      return this!;
    }
  }
}
