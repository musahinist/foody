import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/restaaurant_card_widget.dart';
import '../../../common/widget/search_appbar_widget.dart';
import '../../product/page/product_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> labels = ['All Restaurants', 'My Address'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      backgroundColor: Colors.lightGreen[50],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Favorite \nRestaurants',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(
          //   height: 75,
          //   child: ToggleBar(
          //     labels: labels,
          //     textColor: Colors.grey,
          //     labelTextStyle: Theme.of(context).textTheme.headline6,
          //     selectedTextColor: Colors.black,
          //     backgroundColor: Colors.blueGrey[100],
          //     selectedTabColor: Colors.lightGreen[50],
          //     onSelectionUpdated: (index) =>
          //         setState(() => currentIndex = index),
          //   ),
          // ),
          const SizedBox(height: 8),
          RestaurantCardWidget(onPressed: () {
            Get.toNamed(ProductPage.$PATH);
          }),
          RestaurantCardWidget(onPressed: () {
            Get.toNamed(ProductPage.$PATH);
          }),
          RestaurantCardWidget(onPressed: () {
            Get.toNamed(ProductPage.$PATH);
          }),
          RestaurantCardWidget(onPressed: () {
            Get.toNamed(ProductPage.$PATH);
          }),
          RestaurantCardWidget(onPressed: () {
            Get.toNamed(ProductPage.$PATH);
          }),
        ],
      ),
    );
  }
}
