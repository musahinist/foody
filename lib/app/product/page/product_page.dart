import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/item_counter_widget.dart';
import '../../home/page/basket_page.dart';
import '../widget/sliver_appbar_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = 'product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<bool> isSelected = [false, false, false];
  bool isLiked = false;
  double price = 45.00;
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            heroTag: "basket",
            onPressed: () {
              Get.toNamed(BasketPage.$PATH);
            },
            child: const Icon(Icons.shopping_bag),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.blue,
            child: Text(
              '$itemCount',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            //  floating: true,
            pinned: true,
          ),
          const SliverAppBarWidget(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                ListTile(
                  title: const Text(
                    'Beef Cheese Burger',
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_half, color: Colors.amber)
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      isLiked = !isLiked;
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_outline,
                          color: isLiked ? Colors.red : Colors.grey,
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      'Food consist of one or more cooked patties of ground meat, usualy beef placed inside a sliced bread roll or bun'),
                ),
                ExpansionTile(
                  title: const Text('Toppings'),
                  children: [
                    ListTile(
                      title: const Text('Pickles'),
                      trailing: isSelected[0]
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.add),
                      onTap: () {
                        isSelected[0] = !isSelected[0];
                        isSelected[0] ? price++ : price--;
                        setState(() {});
                      },
                    ),
                    ListTile(
                      title: const Text('Lettuce'),
                      trailing: isSelected[1]
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.add),
                      onTap: () {
                        isSelected[1] = !isSelected[1];
                        isSelected[1] ? price++ : price--;
                        setState(() {});
                      },
                    ),
                    ListTile(
                      title: const Text('Onions'),
                      trailing: isSelected[2]
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.add),
                      onTap: () {
                        isSelected[2] = !isSelected[2];
                        isSelected[2] ? price++ : price--;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemCounterWidget(),
                      Text('TL $price',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 32,
                        // width: 32,
                        child: ElevatedButton(
                          onPressed: () {
                            itemCount++;
                            setState(() {});
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber[700]),
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                          ),
                          child: const Center(
                            child: Text('Add To Basket'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
