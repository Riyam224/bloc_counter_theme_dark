import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;

  void increment() {
    counter++;
    emit(CounterStateChanging(counter));
  }

  void decrement() {
    counter--;
    emit(CounterStateChanging(counter));
  }

  void resetCounter() {
    counter = 0;
    emit(CounterStateChanging(counter));
  }
}
