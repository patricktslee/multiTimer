import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_timer/controllers/commands/add_counter_command.dart';
import 'package:multi_timer/controllers/commands/remove_counter_command.dart';
import 'package:multi_timer/controllers/counter_controller.dart';

import 'counting_column.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get Fluttered'),
      ),
      body: GetBuilder<CounterController>(
        init: CounterController(),
        builder: (controller) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...controller.model.counterList
                    .map((e) => CountingColumn(item: e)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => RemoveCounterCommand().execute(),
          ),
          FloatingActionButton(
            child: const Icon(Icons.plus_one),
            onPressed: () => AddCounterCommand().execute(),
          ),
        ],
      ),
    );
  }
}
