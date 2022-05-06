import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCounterBloc extends Cubit<int> {
  SimpleCounterBloc() : super(0);

  void plusOne() => emit(state + 1);
  void minusOne() => emit(state - 1);

  void resetCounter() => emit(0);
}
