import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.height <= 600;
}

class Dimensions {
  // >>> Lấy ra chiều rộng và chiều cao của thiết bị bằng getX:
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  // >>> Tỉ lệ scale cho màn hình thiết bị = chiều cao thiết bị / tỉ lệ màn thiết bị:
  static double widthMobileAspectRatio = screenWidth / 360;
  static double heightMobileAspectRatio = screenHeight / 800;

  static double widthTabletAspectRatio = screenWidth / 768;
  static double heightTabletAspectRatio = screenHeight / 1024;

  static double get widthAspectRatio =>
      isMobile(Get.context!) ? widthMobileAspectRatio : widthTabletAspectRatio;

  static double get heightAspectRatio => isMobile(Get.context!)
      ? heightMobileAspectRatio
      : heightTabletAspectRatio;

  static double width(double value) => widthAspectRatio * value;

  static double height(double value) => heightAspectRatio * value;

  // >>> Chiều cao cho các phần tử trong food_page.dart:
  static double pageView = screenHeight / 2.6;
  static double pageViewContainer = screenHeight / 3.4;
  static double pageViewTextContainer = screenHeight / 5.4;
}
