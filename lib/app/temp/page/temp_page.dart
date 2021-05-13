import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/temp_bloc.dart';

class TempPage extends StatelessWidget {
  const TempPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = 'temp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TempBloc, TempState>(
        builder: (context, state) {
          if (state is TempLoadedState) {
            return const Center(
              child: Text('temp'),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
