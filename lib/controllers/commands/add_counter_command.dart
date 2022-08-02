import 'abstract_command.dart';

class AddCounterCommand extends CounterAbstractCommand {
  Future<void> execute([int? value]) async {
    value = value ?? 0;
    controller.model.addCounter(value);
    // controller.model.event(CounterEvent.add(value));
    controller.update();
  }
}
