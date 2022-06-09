import 'package:bloc_listener/bloc/connecrtion_state.dart';
import 'package:bloc_listener/bloc/connection_bloc.dart';
import 'package:bloc_listener/bloc/counter_cubit.dart';
import 'package:bloc_listener/bloc/counter_state.dart';
import 'package:bloc_listener/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          // context.bloc<CounterCubit>().increment();
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
          body: Column(children: [
        SizedBox(
          height: 100,
        ),
        BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
          if (state is InternetConnected &&
              state.connectionType == ConnectionType.Wifi) {
            return Text('Wifi');
          } else if (state is InternetConnected &&
              state.connectionType == ConnectionType.Mobile) {
            return Text('Mobile');
          } else if (state is InternetDisconnected) {
            return Text('Disconnected');
          } else {
            return CircularProgressIndicator();
          }
        }),
        SizedBox(
          height: 20,
        ),
        BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
          if (state.counterValue < 0) {
            return Center(
              child: Text(
                'Counter Value ' + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else if (state.counterValue == 0) {
            return Center(
              child: Text(
                'Counter Value ' + state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else
            return Center(
              child: Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            );
        }, listener: (context, state) {
          if (state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Incremented'),
              duration: Duration(seconds: 3),
            ));
          } else if (state.wasIncremented == false) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Decremente'),
            ));
          }
        })
      ])),
    );
  }
}
