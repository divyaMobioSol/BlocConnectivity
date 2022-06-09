import 'dart:async';

import 'package:bloc_listener/bloc/connecrtion_state.dart';
import 'package:bloc_listener/bloc/connection_bloc.dart';
import 'package:bloc_listener/bloc/counter_state.dart';
import 'package:bloc_listener/constants/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;

  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: true));
  //   internetStreamSubscription = internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Mobile) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Wifi) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
