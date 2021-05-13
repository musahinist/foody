part of 'home_bloc.dart';

abstract class HomePageDataState extends Equatable {
  const HomePageDataState();

  @override
  List<Object> get props => [];
}

class HomePageDataInitial extends HomePageDataState {}

class HomePageDataLoadingState extends HomePageDataState {
  const HomePageDataLoadingState();

  @override
  List<Object> get props => [];
}

class HomePageDataLoadedState extends HomePageDataState {
  const HomePageDataLoadedState({required this.products});
  final List<Product> products;

  @override
  List<Object> get props => [];
}

class HomePageDataErrorState extends HomePageDataState {
  const HomePageDataErrorState({required this.error});
  final String error;
  @override
  List<Object> get props => [];
}
