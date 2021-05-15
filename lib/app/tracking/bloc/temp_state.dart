part of 'temp_bloc.dart';

abstract class TempState extends Equatable {
  const TempState();
  
  @override
  List<Object> get props => [];
}

class TempInitial extends TempState {}
