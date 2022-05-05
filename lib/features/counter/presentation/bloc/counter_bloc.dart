import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void plusOne() => emit(state + 1);
  void minusOne() => emit(state - 1);

  void plusTen() => emit(state + 10);
  void minusTen() => emit(state - 10);

  void plusHundred() => emit(state + 100);
  void minusHundred() => emit(state - 100);

  void plusThousand() => emit(state + 1000);
  void minusThousand() => emit(state - 1000);

  void resetCounter() => emit(state - state);
}
