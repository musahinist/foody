part of 'temp_bloc.dart';

abstract class TempEvent extends Equatable {
  const TempEvent();

  @override
  List<Object> get props => [];
}

class TempRequestedEvent extends TempEvent {
  const TempRequestedEvent();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'TempRequestedEvent';
}
