import 'package:bloc/bloc.dart';

/// The events which `CounterBloc` will react to.
abstract final class CounterEvent {}

/// Notifies bloc to increment state.
final class CounterIncrementPressed extends CounterEvent {}

/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
final class CounterBloc extends Bloc<CounterEvent, int> {
  /// The initial state of the `CounterBloc` is 0.
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}
