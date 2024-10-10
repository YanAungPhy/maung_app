import 'package:flutter/material.dart';
import 'app_colors.dart';


class ThemeHelper {
  static ThemeData themes() {
    return ThemeData(
      primarySwatch: Colors.teal,
      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColor.greenSecondry),
        ),
        indicatorColor: AppColor.greenSecondry,
        backgroundColor: AppColor.greenBlack,
        iconTheme: MaterialStateProperty.all(
          const IconThemeData(color: AppColor.greenSecondry),
        ),
      ),
    );
  }
}