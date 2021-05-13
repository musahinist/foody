import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../util/http/http_exception.dart';

part 'temp_event.dart';
part 'temp_state.dart';

class TempBloc extends Bloc<TempEvent, TempState> {
  TempBloc() : super(TempInitial());
  // final TempRepo _tempRepo = TempRepo();

  @override
  Stream<TempState> mapEventToState(
    TempEvent event,
  ) async* {
    if (event is TempRequestedEvent) {
      yield const TempLoadingState();
      try {
        yield const TempLoadedState();
      } catch (e) {
        yield TempErrorState(error: HttpException.handleError(e));
      }
    }
  }
}
