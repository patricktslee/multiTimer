import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_timer/controllers/commands/my_timer_command.dart';
import 'package:multi_timer/controllers/my_timer_controller.dart';
import 'package:multi_timer/views/timer/timer_widget.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Multiple Timer'),
      ),
      body: GetBuilder<MyTimerController>(
        init: MyTimerController(),
        builder: (controller) {
          return (width < 820)
              ? singleColumn(controller)
              : (width > 1100)
                  ? threeColumn(controller)
                  : twoColumn(controller);
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //FloatingActionButton(
          //  child: const Icon(Icons.exposure_minus_1),
          //  onPressed: () => RemoveMyTimerCommand().execute(),
          //),
          FloatingActionButton(
            child: const Icon(Icons.plus_one),
            onPressed: () => AddMyTimerCommand().execute(),
          ),
        ],
      ),
    );
  }

  Widget singleColumn(MyTimerController controller) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...controller.model.myTimerList.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TimerWidget(item: e),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget twoColumn(MyTimerController controller) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 400 / 300,
        shrinkWrap: true,
        children: List.generate(
            controller.model.myTimerList.length,
            (e) => SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TimerWidget(item: controller.model.myTimerList[e]),
                  ),
                )),
      ),
    );
  }

  Widget threeColumn(MyTimerController controller) {
    return Center(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 400 / 300,
        shrinkWrap: true,
        children: List.generate(
            controller.model.myTimerList.length,
            (e) => SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TimerWidget(item: controller.model.myTimerList[e]),
                  ),
                )),
      ),
    );
  }
}
