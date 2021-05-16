part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class OrderLoadingState extends ProductState {}

class OrderLoadedState extends ProductState {
  const OrderLoadedState({
    required this.orders,
    required this.history,
  });
  final DocumentSnapshot<Map> orders;
  final DocumentSnapshot<Map> history;
  @override
  List<Object> get props => [];
}
