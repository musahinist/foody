import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/pageview_dot_indicator_widget.dart';
import '../../../common/widget/restaaurant_card_widget.dart';
import '../../../common/widget/search_appbar_widget.dart';
import '../../order/page/order_page.dart';
import '../../product/page/product_page.dart';
import '../../profile/page/profile_page.dart';
import 'favorites_page.dart';

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
      appBar: SearchAppBar(),
      backgroundColor: Colors.lightGreen[50],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SliderWidget(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Main Categories',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //   const SizedBox(height: 24),
          const CategoryMenu(),
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

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: double.maxFinite,
          child: PageView(
            children: [
              const CampaignCard(),
              const CampaignCard(),
              const CampaignCard(),
            ],
          ),
        ),
        PageViewDotIndicator(
          currentIndex: 1,
          dotCount: 3,
        )
      ],
    );
  }
}

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.black.withOpacity(.7),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://www.droetker.com.tr/Recipe/Recipes/droetker.com.tr/tr-tr/baking/image-thumb__25342__RecipeDetail/karisik-pizza.jpg'),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black.withOpacity(.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "50% off",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "the full price of pizza",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
