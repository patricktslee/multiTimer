import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:multi_timer/helpers/log.dart';

class MyTimer {
  late Timer myTimer;
  Rx<Duration> myDuration;
  late Rx<Duration> currentDuration;
  RxString result;
  late bool isCompleted;
  final player = AudioPlayer();
  Rx<String> assetSource = 'PUSH.WAV'.obs;
  List list = ['PUSH.WAV', 'CHIMES.WAV', 'rooster.wav'];
  List iconImage = [
    'boiling-water.png',
    'chimes.png',
    'chicken-icon-32101.png'
  ];
  List nameList = ['Boiling Water', 'Chimes', 'Chicken'];

  MyTimer({Rx<Duration>? myDuration})
      : myDuration = myDuration ?? const Duration(seconds: 0).obs,
        result = "Waiting to start".obs,
        isCompleted = false,
        myTimer = Timer(const Duration(seconds: 0), (() => "Starting"));

  void setPlaySound(String newPath) {
    assetSource.value = newPath;
  }

  void startTimer() {
    isCompleted = false;
    myTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    result.value = "Starting countdown";
  }

  void stopTime() {
    myTimer.cancel();
    isCompleted = false;
    result.value = "Stop the countdown";
  }

  void resetTime() {
    stopTime();
    myDuration.value = const Duration(seconds: 0);
    result.value = "Reset the duration";
  }

  void setDuration(Duration newDuration) {
    myDuration.value = newDuration;
    result.value = "Duration update";
  }

  void setCountDown() {
    const reduceSecondsBy = 1;

    final seconds = myDuration.value.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      myTimer.cancel();
      isCompleted = true;
      result.value = "Countdown completed";
    } else {
      myDuration.value = Duration(seconds: seconds);
    }
    logger.info("Current Timer is ${myDuration.value.toString()}");
  }

  @override
  String toString() {
    return "My Timer is ${myTimer.toString()}";
  }
}
