part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class UserInfoRequestedEvent extends ProductEvent {
  const UserInfoRequestedEvent({required this.user});
  final user;

  @override
  List<Object> get props => [];
}

class GetOrdersEvent extends ProductEvent {
  const GetOrdersEvent();

  @override
  List<Object> get props => [];
}

class AddOrderToBasketEvent extends ProductEvent {
  const AddOrderToBasketEvent({required this.order});
  final order;

  @override
  List<Object> get props => [];
}

class AddOrderToHistoryEvent extends ProductEvent {
  const AddOrderToHistoryEvent({required this.order});
  final order;

  @override
  List<Object> get props => [];
}

class RemovwOrderFromBasketEvent extends ProductEvent {
  const RemovwOrderFromBasketEvent({required this.order});
  final order;

  @override
  List<Object> get props => [];
}
