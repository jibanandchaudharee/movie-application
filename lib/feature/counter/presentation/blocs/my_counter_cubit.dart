import 'package:flutter_bloc/flutter_bloc.dart';

class MyCounterCubit extends Cubit<int> {
  MyCounterCubit() : super(0);

  void incrementCounter() {
    int count = state;

    final int counterValue = ++count;

    emit(counterValue);
  }
}
