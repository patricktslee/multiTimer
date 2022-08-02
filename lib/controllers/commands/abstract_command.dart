import 'package:get/get.dart';
import 'package:multi_timer/controllers/counter_controller.dart';
import 'package:multi_timer/controllers/my_timer_controller.dart';

abstract class CounterAbstractCommand {
  CounterController get controller => Get.find();
}

abstract class MyTimerAbstractCommand {
  MyTimerController get controller => Get.find();
}
