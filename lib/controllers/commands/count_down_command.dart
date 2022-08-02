import 'package:multi_timer/models/data/counter.dart';

import 'abstract_command.dart';

class CountDownCommand extends CounterAbstractCommand {
  Future<void> execute(Counter item) async {
    item.counter.value--;
    // controller.update();
  }
}
