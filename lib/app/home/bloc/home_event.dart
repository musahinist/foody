part of 'home_bloc.dart';

abstract class HomePageDataEvent extends Equatable {
  const HomePageDataEvent();

  @override
  List<Object> get props => [];
}

class HomePageDataRequestedEvent extends HomePageDataEvent {
  const HomePageDataRequestedEvent();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'HomePageDataRequestedEvent';
}
