import 'package:flutter/material.dart';
import 'package:foody/app/home/page/cart_page.dart';
import 'package:get/route_manager.dart';

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
            onPressed: () {
              Get.toNamed(CartPage.$PATH);
            },
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.blue,
            child: Text("$itemCount",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
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
                  trailing: Container(
                      //   padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                          onPressed: () {
                            isLiked = !isLiked;
                            setState(() {});
                          },
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_outline,
                            color: isLiked ? Colors.red : Colors.grey,
                          ))),
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
                      title: Text('Lettuce'),
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
                      title: Text('Onions'),
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
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.add)),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      const Spacer(),
                      Text('TL $price',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      itemCount++;
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[700]),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Add To Cart'),
                      ),
                    ),
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

// class MySliverAppBar extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;

//   MySliverAppBar({required this.expandedHeight});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       overflow: Overflow.visible,
//       children: [
//         Image.network(
//           "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//           fit: BoxFit.cover,
//         ),
//         Center(
//           child: Opacity(
//             opacity: shrinkOffset / expandedHeight,
//             child: Text(
//               "MySliverAppBar",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 23,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: expandedHeight / 2 - shrinkOffset,
//           left: MediaQuery.of(context).size.width / 4,
//           child: Opacity(
//             opacity: (1 - shrinkOffset / expandedHeight),
//             child: Card(
//               elevation: 10,
//               child: SizedBox(
//                 height: expandedHeight,
//                 width: MediaQuery.of(context).size.width / 2,
//                 child: FlutterLogo(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }
