part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterStateChanging extends CounterState {
  final int counter;
  CounterStateChanging(this.counter);
}
