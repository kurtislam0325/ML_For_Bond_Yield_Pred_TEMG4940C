import 'package:get/get.dart';


class ScreenController extends GetxController {
  RxString currentScreen = "Model's Evaluation".obs;
  // Model's Evaluation || Exploratory Data Analysis || Model's Insights
  RxString currentAccuracy = "LR".obs;
  // LR || RF
}