import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/app/order/page/order_page.dart';
import 'package:foody/app/product/page/product_page.dart';

import '../../profile/page/profile_page.dart';
import '../../../common/widget/restaaurant_card_widget.dart';
import 'package:get/route_manager.dart';

import 'favorites_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageBody(),
    const FavoritesPage(),
    const OrderPage(),
    const ProfilePage()
  ];
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

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
              'Main \nCategories',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 112,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                MenuButtonWidget(
                  isActive: true,
                  icon: Icons.fastfood,
                  label: 'Burgers Mis',
                ),
                MenuButtonWidget(
                  icon: Icons.local_pizza,
                  label: 'Pizza Hots',
                ),
                MenuButtonWidget(
                  icon: Icons.restaurant_menu,
                  label: 'KeBap Döner',
                ),
                MenuButtonWidget(
                  icon: Icons.signal_cellular_4_bar,
                  label: 'Snacks Bar',
                ),
                MenuButtonWidget(
                  icon: Icons.translate,
                  label: 'Chenese Food',
                ),
                MenuButtonWidget(
                  icon: Icons.home,
                  label: 'Home Food',
                ),
              ],
            ),
          ),
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

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    Key? key,
    this.isActive = false,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 64,
        decoration: BoxDecoration(
          color: isActive ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Icon(icon),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
