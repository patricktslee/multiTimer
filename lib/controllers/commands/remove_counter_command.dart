import 'package:multi_timer/helpers/log.dart';
import 'package:multi_timer/models/data/counter.dart';
import 'abstract_command.dart';

class RemoveCounterCommand extends CounterAbstractCommand {
  Future<void> execute([Counter? value]) async {
    logger.info(value.toString());
    controller.model.removeCounter(value);
    // controller.model.event(CounterEvent.remove(value));
    controller.update();
  }
}
