import 'package:get/get.dart';

class Dimensions {
  // >>> Lấy ra chiều rộng và chiều cao của thiết bị bằng getX:
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  // >>> Tỉ lệ scale cho màn hình thiết bị = chiều cao thiết bị / tỉ lệ màn thiết bị:
  static final double mobileScaleRatio = screenHeight / 844;
  static final double tabletScaleRatio = screenHeight / 1024;

  // >>> Chiều cao cho các phần tử trong food_page.dart:
  static double pageView = screenHeight / 2.6;
  static double pageViewContainer = screenHeight / 3.4;
  static double pageViewTextContainer = screenHeight / 5.4;

  static double height4 = mobileScaleRatio * 4;
  static double height10 = mobileScaleRatio * 10;
  static double height15 = mobileScaleRatio * 15;
  static double height20 = mobileScaleRatio * 20;

  static double weight4 = mobileScaleRatio * 4;
  static double weight10 = mobileScaleRatio * 10;
  static double weight15 = mobileScaleRatio * 15;
  static double weight20 = mobileScaleRatio * 20;

  static double font20 = mobileScaleRatio * 20;

  static double radius20 = mobileScaleRatio * 20;
  static double radius30 = mobileScaleRatio * 30;

  static double iconSize24 = mobileScaleRatio * 24;
}
