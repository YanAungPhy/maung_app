import 'package:flutter/material.dart';

Future<dynamic> showLoading(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctxt) => Center(child: CircularProgressIndicator()));
}
