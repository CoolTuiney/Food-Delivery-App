import 'dart:async';

enum CounterAction { increment, decrement, reset, fetch }

class Counterbloc {
  int counter = 1;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get _counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;
  int get getCounter => counter;
  final _eventSreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventSreamController.sink;
  Stream<CounterAction> get _eventStream => _eventSreamController.stream;

  Counterbloc() {
    _eventStream.listen((event) {
      if (event == CounterAction.increment) {
        counter++;
      } else if (event == CounterAction.decrement) {
        if (counter > 1) {
          counter--;
        }
      } else if (event == CounterAction.reset) {
        counter = 1;
      }
      _counterSink.add(counter);
    });
  }
  void dispose() {
    _stateStreamController.close();
    _eventSreamController.close();
  }
}
