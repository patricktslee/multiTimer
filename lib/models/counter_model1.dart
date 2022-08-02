import 'package:get/get.dart';
import 'package:multi_timer/models/data/counter.dart';

/// Benefits:
/// simple, straightforward
/// functionally immutable given final variable
/// no other classes required for state management
///
/// Drawbacks:
/// Events/state inextricably linked with object
/// More difficult to keep a list of past states
/// No specific record of events, just called as functions

class CounterModel {
  final List<Counter> _counterList = [
    Counter(0),
//    Counter(counter: 3.obs),
//    Counter(counter: 7.obs),
  ];

  List<Counter> get counterList => _counterList;

  void addCounter([int? value]) =>
      _counterList.add(Counter(counterList.length, counter: value?.obs));

  void removeCounter([Counter? counter]) {
    if (_counterList.isNotEmpty) {
      (counter == null)
          ? _counterList.removeLast()
          : _counterList.removeWhere((e) => e == counter);
    }
  }
}
