// import 'package:flutter/material.dart';
//
// extension ContextExt on BuildContext {
//
//   void back<T extends Object?>([T? result]) {
//     return Navigator.of(this).pop();
//   }
//
//   Future<T?> left<T extends Object?>(
//       String newRouteName,
//       RoutePredicate predicate, {
//         Object? arguments,
//       }) {
//     return Navigator.of(this).pushNamedAndRemoveUntil<T>(
//         newRouteName, predicate,
//         arguments: arguments);
//   }
//
//   Future<T?> toName<T extends Object?>(
//       String routeName, {
//         Object? arguments,
//       }) {
//     return Navigator.of(this).pushNamed(routeName, arguments: arguments);
//   }
// }


import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Future<dynamic> go(Widget pageWidget) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (context) {
        return pageWidget;
      }),
    );
  }

  Future<dynamic> left(Widget pageWidget) {
    return Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return pageWidget;
        }), (route) => false);
  }

  void back() {
    return Navigator.of(this).pop();
  }
}