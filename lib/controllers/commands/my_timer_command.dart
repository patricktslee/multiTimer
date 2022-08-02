import 'dart:async';

import 'package:multi_timer/helpers/log.dart';
import 'package:multi_timer/models/data/my_timer.dart';

import 'abstract_command.dart';

class AddMyTimerCommand extends MyTimerAbstractCommand {
  Future<void> execute([Duration? value]) async {
    value = (value ?? const Duration(seconds: 0));
    controller.model.addMyTimer(value);
    // controller.model.event(CounterEvent.add(value));
    controller.update();
  }
}

class RemoveMyTimerCommand extends MyTimerAbstractCommand {
  Future<void> execute([MyTimer? value]) async {
    logger.info(value.toString());
    controller.model.removeMyTimer(value);
    // controller.model.event(CounterEvent.remove(value));
    controller.update();
  }
}

class MyTimerDurationCommand extends MyTimerAbstractCommand {
  Future<void> execute(MyTimer item, Duration duration) async {
    item.setDuration(duration);
    // controller.update();
  }
}

class MyTimerStartCommand extends MyTimerAbstractCommand {
  Future<void> execute(MyTimer item) async {
    item.startTimer();
    // controller.update();
  }
}

class MyTimerStopCommand extends MyTimerAbstractCommand {
  Future<void> execute(MyTimer item) async {
    item.stopTime();
    // controller.update();
  }
}

class MyTimerResetCommand extends MyTimerAbstractCommand {
  Future<void> execute(MyTimer item) async {
    item.resetTime();
    // controller.update();
  }
}
