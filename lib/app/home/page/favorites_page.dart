import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/app/product/page/product_page.dart';

import '../../../common/widget/restaaurant_card_widget.dart';
import 'package:get/route_manager.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        leading: const Icon(
          CupertinoIcons.slider_horizontal_3,
          color: Colors.black,
        ),
        elevation: 0,
        title: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.blueGrey[100],
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: 'Search...'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
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
