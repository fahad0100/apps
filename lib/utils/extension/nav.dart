import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Nav on BuildContext {
  moveTo({
    required String routeName,
    Object? extra,
    Function(Object?)? onValue,
  }) {
    return GoRouter.maybeOf(
      this,
    )?.push(routeName, extra: extra).then(onValue ?? (value) {});
  }

  moveAndRemove({
    required String routeName,
    Object? extra,
    Function(Object?)? onValue,
  }) {
    return GoRouter.maybeOf(
      this,
    )?.replace(routeName, extra: extra).then(onValue ?? (value) {});
  }
}
