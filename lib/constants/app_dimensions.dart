import 'package:get/get.dart';

class AppDimension {
  //Screen parameter
  static final double screenWidth = Get.context!.width;
  static final double screenHeight = Get.context!.height;

  //Heights
  static final double height6 = screenHeight / 823 * 6;
  static final double height8 = screenHeight / 823 * 8;
  static final double height10 = screenHeight / 823 * 10;
  static final double height12 = screenHeight / 823 * 12;
  static final double height14 = screenHeight / 823 * 14;
  static final double height16 = screenHeight / 823 * 16;
  static final double height20 = screenHeight / 823 * 20;
  static final double height24 = screenHeight / 823 * 24;
  static final double height26 = screenHeight / 823 * 26;
  static final double height32 = screenHeight / 823 * 32;
  static final double height40 = screenHeight / 823 * 40;

  //Widths
  static final double width6 = screenWidth / 411 * 6;
  static final double width8 = screenWidth / 411 * 8;
  static final double width10 = screenWidth / 411 * 10;
  static final double width12 = screenWidth / 411 * 12;
  static final double width14 = screenWidth / 411 * 14;
  static final double width16 = screenWidth / 411 * 16;
  static final double width20 = screenWidth / 411 * 20;
  static final double width24 = screenWidth / 411 * 24;
  static final double width26 = screenWidth / 411 * 26;
  static final double width30 = screenWidth / 411 * 30;
  static final double width40 = screenWidth / 411 * 40;

  //get proportional screenWidth
  static double getProportionalScreenWidth(double input) {
    double proportionalWidth = screenWidth / 411 * input;
    return proportionalWidth;
  }

  //get proportional screenHeight
  static double getProportionalScreenHeight(double input) {
    double proportionalHeight = screenHeight / 823 * input;
    return proportionalHeight;
  }
}
