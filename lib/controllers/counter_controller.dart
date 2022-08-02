import 'package:get/get.dart';
import 'package:multi_timer/models/counter_model1.dart';

class CounterController extends GetxController {
  static CounterController get to => Get.find();

  final CounterModel _model = CounterModel();
  CounterModel get model => _model;
}
