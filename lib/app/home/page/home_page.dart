import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/pageview_dot_indicator_widget.dart';
import '../../../common/widget/restaaurant_card_widget.dart';
import '../../../common/widget/search_appbar_widget.dart';
import '../../product/page/product_page.dart';
import '../../profile/page/profile_page.dart';
import '../../tracking/page/tracking_page.dart';
import '../bloc/home_bloc.dart';
import '../data/model/product.dart';
import '../widget/outline_stadium_button_wdiget.dart';
import 'basket_page.dart';
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

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageDataBloc, HomePageDataState>(
        builder: (context, state) {
          if (state is HomePageDataLoadedState) {
            switch (_selectedIndex) {
              case 0:
                return MenuPage(products: state.products);
              case 1:
                return FavoritesPage(products: state.products);
              case 2:
                return const BasketPage();
              case 3:
                return const ProfilePage();
              default:
                return MenuPage(products: state.products);
            }
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
      floatingActionButton: Visibility(
        visible: false,
        child: Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.toNamed(TrackingPage.$PATH);
              },
              heroTag: 'motobike',
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.delivery_dining,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.blue,
              child: Text(
                '1',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.,
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.amber,
            elevation: 0,
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
                icon: SizedBox(child: Icon(Icons.favorite)),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Hero(tag: 'basket', child: Icon(Icons.shopping_bag)),
                label: 'Basket',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(),
                IgnorePointer(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Text(
                      '1',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    //  final state = context.watch<HomePageDataBloc>().state;

    return Scaffold(
      appBar: const SearchAppBar(),
      backgroundColor: Colors.lightGreen[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //   SliverSearchAppBar(),
          const SliderWidget(),
          const CategoryMenu(),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Product product = products[index];
              return RestaurantCardWidget(
                  product: product,
                  onPressed: () {
                    Get.toNamed(ProductPage.$PATH);
                  });
            }, childCount: products.length),
          )
        ],
      ),
    );
  }
}

class SliverSearchAppBar extends StatelessWidget {
  const SliverSearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      floating: true,
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220.0,
      backgroundColor: Colors.lightGreen[50],
      // elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              title: const Text(
                'Special Offers',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ButtonOutlineStadiumWidget(
                title: 'View All',
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 160,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PageView(
                    children: const [
                      CampaignCard(),
                      CampaignCard(),
                      CampaignCard(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PageViewDotIndicator(
                      currentIndex: 1,
                      dotCount: 3,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
              children: const [
                Text(
                  '50% off',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'the full price of pizza',
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
    return SliverAppBar(
      expandedHeight: 160.0,
      backgroundColor: Colors.lightGreen[50],
      //  elevation: 0,
      floating: true,
      // pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        //  title:
        // Text('Burger Story', style: TextStyle(color: Colors.white)),
        //  centerTitle: true,
        background:
            //   const SizedBox(height: 24),
            Column(
          children: [
            ListTile(
              dense: true,
              title: const Text(
                'Populer Food',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ButtonOutlineStadiumWidget(
                title: 'View All',
                onPressed: () {},
              ),
            ),
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
          ],
        ),
        // RestaurantCardWidget(onPressed: () {
        //   Get.toNamed(ProductPage.$PATH);
        // }),
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
