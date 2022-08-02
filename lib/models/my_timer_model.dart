import 'package:get/get.dart';
import 'package:multi_timer/models/data/my_timer.dart';

/// Benefits:
/// simple, straightforward
/// functionally immutable given final variable
/// no other classes required for state management
///
/// Drawbacks:
/// Events/state inextricably linked with object
/// More difficult to keep a list of past states
/// No specific record of events, just called as functions

class MyTimerModel {
  final List<MyTimer> _myTimerList = [
    MyTimer(myDuration: const Duration(seconds: 5).obs),
    MyTimer(myDuration: const Duration(minutes: 1, seconds: 5).obs),
  ];

  List<MyTimer> get myTimerList => _myTimerList;

  void addMyTimer([Duration? value]) =>
      _myTimerList.add(MyTimer(myDuration: value?.obs));

  void removeMyTimer([MyTimer? myTimer]) {
    if (_myTimerList.isNotEmpty) {
      (myTimer == null)
          ? _myTimerList.removeLast()
          : _myTimerList.removeWhere((e) => e == myTimer);
    }
  }
}
