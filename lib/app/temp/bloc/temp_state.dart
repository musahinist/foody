part of 'temp_bloc.dart';

abstract class TempState extends Equatable {
  const TempState();

  @override
  List<Object> get props => [];
}

class TempInitial extends TempState {}

class TempLoadingState extends TempState {
  const TempLoadingState();

  @override
  List<Object> get props => [];
}

class TempLoadedState extends TempState {
  const TempLoadedState();

  @override
  List<Object> get props => [];
}

class TempErrorState extends TempState {
  const TempErrorState({required this.error});
  final String error;

  @override
  List<Object> get props => [];
}
