import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/app/home/data/model/product.dart';
import 'package:foody/app/product/bloc/product_bloc.dart';
import 'package:foody/config/globals.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/item_counter_widget.dart';
import '../../home/page/basket_page.dart';
import '../widget/sliver_appbar_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  static const String $PATH = 'product';
  final Product product;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<bool> isSelected = [false, false, false, false];
  List<String> selecetedToppings = [];
  bool isLiked = false;
  double price = 45.00;
  int itemCount = 0;
  // final product = Get.arguments as Product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            heroTag: 'basket',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BlocProvider.value(
                    value: BlocProvider.of<ProductBloc>(context),
                    child: BasketPage());
              }));
            },
            child: const Icon(Icons.shopping_bag),
          ),
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is OrderLoadedState) {
                //  setState(() {});
              }
            },
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Text(
                    "$orderCount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            //  floating: true,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SliverAppBarWidget(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                ListTile(
                  title: Text(
                    widget.product.name,
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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(widget.product.description),
                ),
                ExpansionTile(
                  title: const Text('Toppings'),
                  children:
                      List.generate(widget.product.toppings.length, (index) {
                    {
                      return ListTile(
                        title: Text(widget.product.toppings[index]),
                        trailing: isSelected[index]
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : const Icon(Icons.add),
                        onTap: () {
                          isSelected[index] = !isSelected[index];
                          isSelected[index]
                              ? selecetedToppings
                                  .add(widget.product.toppings[index])
                              : selecetedToppings
                                  .remove(widget.product.toppings[index]);
                          isSelected[index] ? price++ : price--;
                          setState(() {});
                        },
                      );
                    }
                  }),
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
                            BlocProvider.of<ProductBloc>(context)
                                .add(AddOrderToBasketEvent(order: {
                              "time": Timestamp.now(),
                              "name": widget.product.name,
                              "imgurl": widget.product.imgurl,
                              "totalAmount": price,
                              "isPayed": false,
                              "toppings": selecetedToppings,
                            }));

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
