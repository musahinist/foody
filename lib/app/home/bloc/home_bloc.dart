import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../util/http/http_exception.dart';
import '../data/home_repo.dart';
import '../data/model/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomePageDataBloc extends Bloc<HomePageDataEvent, HomePageDataState> {
  HomePageDataBloc() : super(HomePageDataInitial());
  final HomeRepo _homeRepo = HomeRepo();

  @override
  Stream<HomePageDataState> mapEventToState(
    HomePageDataEvent event,
  ) async* {
    if (event is HomePageDataRequestedEvent) {
      yield const HomePageDataLoadingState();
      try {
        final products = await _homeRepo.getProducts();
        yield HomePageDataLoadedState(products: products);
      } catch (e) {
        yield HomePageDataErrorState(error: HttpException.handleError(e));
      }
    }
  }
}
