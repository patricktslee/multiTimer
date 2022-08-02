import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_timer/controllers/commands/count_down_command.dart';
import 'package:multi_timer/controllers/commands/count_up_command.dart';
import 'package:multi_timer/controllers/commands/remove_counter_command.dart';
import 'package:multi_timer/models/data/counter.dart';

class CountingColumn extends StatelessWidget {
  final Counter item;
  const CountingColumn({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.id.toString(),
              style: const TextStyle(fontSize: 48),
            ),
            FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => CountUpCommand().execute(item)),
            Text(
              item.counter.toString(),
              style: const TextStyle(fontSize: 48),
            ),
            FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => CountDownCommand().execute(item)),
            FloatingActionButton(
                child: const Icon(Icons.cancel),
                onPressed: () => RemoveCounterCommand().execute(item))
          ],
        ));
  }
}
