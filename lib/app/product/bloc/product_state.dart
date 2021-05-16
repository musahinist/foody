part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class OrderLoadingState extends ProductState {}

class OrderLoadedState extends ProductState {
  const OrderLoadedState({required this.orders});
  final DocumentSnapshot<Map> orders;
  @override
  List<Object> get props => [];
}
