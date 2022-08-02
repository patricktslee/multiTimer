import 'package:get/get.dart';

class Counter {
  RxInt counter;
  final int id;

  Counter(this.id, {RxInt? counter}) : counter = counter ?? 0.obs;

  @override
  String toString() {
    return "Counter ID is ${id.toString()} and value is ${counter.value.toString()}";
  }
}
