import 'package:get/get.dart';
import 'package:multi_timer/models/my_timer_model.dart';

class MyTimerController extends GetxController {
  static MyTimerController get to => Get.find();

  final MyTimerModel _model = MyTimerModel();
  MyTimerModel get model => _model;
}
