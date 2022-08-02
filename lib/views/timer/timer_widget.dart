import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_timer/controllers/commands/my_timer_command.dart';
//import 'package:multi_timer/controllers/counter_controller.dart';
import 'package:multi_timer/helpers/log.dart';
import 'package:multi_timer/models/data/my_timer.dart';

class TimerWidget extends StatelessWidget {
  final MyTimer item;
  const TimerWidget({Key? key, required this.item}) : super(key: key);

  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    //
    Timer completion;

    completion = Timer.periodic(const Duration(seconds: 1), (timer) {});
    completion.cancel();
    int newHours = 0;
    int newMinutes = 0;
    int newSeconds = 0;
    return Obx(() {
      //final days = strDigits(item.myDuration.value.inDays);
      // Step 7
      final hours = strDigits(item.myDuration.value.inHours.remainder(24));
      final minutes = strDigits(item.myDuration.value.inMinutes.remainder(60));
      final seconds = strDigits(item.myDuration.value.inSeconds.remainder(60));
      final List list = item.list;
      item.isCompleted
          ? completion = Timer.periodic(const Duration(seconds: 3), (_) async {
              logger.info("Completed");
              await item.player.play(AssetSource(
                  item.assetSource.value)); //              FlutterBeep.beep();
              logger.info("Completed to play sound");
            })
          : completion.cancel();
      return Card(
        elevation: 8,
        shadowColor: Colors.green,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 400,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$hours:$minutes:$seconds',
                      style: const TextStyle(fontSize: 48),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                            child: const Icon(Icons.play_circle),
                            onPressed: () =>
                                MyTimerStartCommand().execute(item)),
                        FloatingActionButton(
                            child: const Text('H'),
                            onPressed: () {
                              newHours++;
                              MyTimerDurationCommand().execute(
                                  item,
                                  Duration(
                                      hours: newHours,
                                      minutes: newMinutes,
                                      seconds: newSeconds));
                            }),
                        FloatingActionButton(
                            child: const Text('M'),
                            onPressed: () {
                              newMinutes++;
                              MyTimerDurationCommand().execute(
                                  item,
                                  Duration(
                                      hours: newHours,
                                      minutes: newMinutes,
                                      seconds: newSeconds));
                            }),
                        FloatingActionButton(
                            child: const Text('S'),
                            onPressed: () {
                              newSeconds++;
                              MyTimerDurationCommand().execute(
                                  item,
                                  Duration(
                                      hours: newHours,
                                      minutes: newMinutes,
                                      seconds: newSeconds));
                            }),
                        FloatingActionButton(
                            child: const Icon(Icons.stop),
                            onPressed: () {
                              completion.cancel();
                              item.player.release();
                              MyTimerStopCommand().execute(item);
                            }),
                      ],
                    ),
                  ],
                ),
                Text(
                  item.result.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        child: const Icon(Icons.reset_tv_sharp),
                        onPressed: () {
                          newHours = 0;
                          newMinutes = 0;
                          newSeconds = 0;
                          MyTimerResetCommand().execute(item);
                        }),
                    DropdownButton<String>(
                      hint: const Text(
                        'Choose the sound',
                      ),
                      items: list
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                "${item.nameList[list.indexOf(e)]}",
                                style: TextStyle(
                                  color: Colors.red.withOpacity(1.0),
                                  fontWeight: FontWeight.w300, // light
                                  fontStyle: FontStyle.italic, // italic
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: item.assetSource.value,
                      underline: Container(),
                      selectedItemBuilder: (context) {
                        return list.map<Widget>((e) {
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
//                                Image.asset('images/chimes.png'),
//                                    '${item.iconImage[list.indexOf(e)]}'),
                                Image(
                                    image: AssetImage(
                                        'images/${item.iconImage[list.indexOf(e)]}')),
                                Text(
                                  "${item.nameList[list.indexOf(e)]}",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(1.0),
                                    fontWeight: FontWeight.w300, // light
                                    fontStyle: FontStyle.italic, // italic
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      onChanged: (value) {
                        item.setPlaySound(value!);
                      },
                    ),
                    FloatingActionButton(
                        child: const Icon(Icons.cancel),
                        onPressed: () {
                          completion.cancel();
                          item.player.release();
                          RemoveMyTimerCommand().execute(item);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
