import 'package:mobx/mobx.dart';

part 'counter_mobx.g.dart';

class CounterMobx = _CounterMobxBase with _$CounterMobx;

abstract class _CounterMobxBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}
