import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/app/product/data/product_repo.dart';
import 'package:foody/util/http/http_manager.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());
  final ProductRepo _productRepo = ProductRepo();
  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetOrdersEvent) {
      final orders = await _productRepo.getOrders();
      final history = await _productRepo.getHistory();

      yield OrderLoadedState(orders: orders, history: history);
    }

    if (event is AddOrderToBasketEvent) {
      yield OrderLoadingState();
      await _productRepo.addToBasket(event.order);
      final orders = await _productRepo.getOrders();
      // yield OrderLoadedState(orders: orders);
      add(GetOrdersEvent());
    }
    if (event is RemovwOrderFromBasketEvent) {
      yield OrderLoadingState();
      await _productRepo.removeFromBasket(event.order);
      //  final orders = await _productRepo.getOrders();
      //  yield OrderLoadedState(orders: orders);
      add(GetOrdersEvent());
    }
    if (event is AddOrderToHistoryEvent) {
      yield OrderLoadingState();
      await _productRepo.addToHistory(event.order);
      await _productRepo.removeFromBasket(event.order);
      //  final orders = await _productRepo.getOrders();
      //  yield OrderLoadedState(orders: orders);
      add(GetOrdersEvent());
    }
  }
}
