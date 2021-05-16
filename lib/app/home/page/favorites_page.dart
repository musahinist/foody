import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/app/product/bloc/product_bloc.dart';
import 'package:foody/app/product/page/product_page.dart';
import 'package:foody/common/widget/restaaurant_card_widget.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/search_appbar_widget.dart';
import '../data/model/product.dart';
import 'home_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;
//  final List<String> labels = ['All Restaurants', 'My Address'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SearchAppBar(),
        backgroundColor: Colors.lightGreen[50],
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //   SliverSearchAppBar(),
            const SliderWidget(),
            const FavoriteHeader(),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Product product = products[index];
                return RestaurantCardWidget(
                    product: product,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BlocProvider.value(
                            value: BlocProvider.of<ProductBloc>(context),
                            child: ProductPage(
                              product: product,
                            ));
                      }));
                    });
              }, childCount: products.length),
            )
          ],
        ));
  }
}

class FavoriteHeader extends StatelessWidget {
  const FavoriteHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 20,
      backgroundColor: Colors.lightGreen[50],
      // elevation: 0,
      floating: true,
      title: const Text(
        'Favorites',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
    );
  }
}
