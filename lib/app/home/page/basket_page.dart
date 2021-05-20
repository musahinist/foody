import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import 'package:foody/app/home/widget/outline_stadium_button_wdiget.dart';
import 'package:foody/app/product/bloc/product_bloc.dart';

import '../../../common/widget/item_counter_widget.dart';
import '../../product/page/checkout_page.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);
  static const String $PATH = 'Basket';

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  var orders = [];
  var history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Basket'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is OrderLoadedState) {
              orders = state.orders.data()!["orders"];
              history = state.history.data()!["history"] ?? [];
              return _Body(
                  orders: state.orders.data()!["orders"],
                  history: state.history.data()!["history"] ?? []);
            }
            return _Body(
              orders: orders,
              history: history,
            );
          },
        ));
  }
}

class _Body extends StatelessWidget {
  final List orders;
  final List history;

  const _Body({
    Key? key,
    required this.orders,
    required this.history,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double totalPayment = 0;
    orders.forEach((order) {
      totalPayment += order["totalAmount"];
    });
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('${orders.length} food selected',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        if (orders.isNotEmpty)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(orders.length, (index) {
                    return OrderSummaryList(order: orders[index]);
                  }),
                ),
              ),
              ListTile(
                dense: true,
                subtitle: Text('SubTotal'),
                trailing: Text('TL $totalPayment'),
              ),
              const ListTile(
                dense: true,
                subtitle: Text('Delivery Charge'),
                trailing: Text('Free Delivery'),
              ),
              const Divider(),
              ListTile(
                title: Text('Total Amount'),
                trailing: Text('TL $totalPayment',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        backgroundColor: Colors.transparent,
                        child: BlocProvider.value(
                          value: BlocProvider.of<ProductBloc>(context),
                          child: CheckoutPage(
                            orders: orders,
                            totalPayment: totalPayment,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber[700]),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Pay All'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(history.length, (index) {
              return OrderHistoryList(
                  order: (history.reversed).elementAt(index));
            }),
          ),
        ),
      ],
    );
  }
}

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Map<String, dynamic> order;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(order["imgurl"]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order['name'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(order['restaurant']),
                      const SizedBox(height: 5),
                      Text(order['toppings'].length > 0
                          ? "+${order['toppings']}"
                          : "")
                      //  ItemCounterWidget()
                      // Row(
                      //   children: List.generate(order["toppings"].length, (index) {
                      //     return Text("+" + order['toppings'][index]);
                      //   }),
                      // )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("TL ${order['totalAmount']}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      SizedBox(
                        height: 32,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 72,
                              child: ButtonOutlineStadiumWidget(
                                title: 'Pay',
                                color: Colors.green,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: BlocProvider.value(
                                        value: BlocProvider.of<ProductBloc>(
                                            context),
                                        child: CheckoutPage(
                                          orders: [order],
                                          totalPayment: order['totalAmount'],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // IconButton(

                            //   icon: Icon(Icons.payment),
                            //   color: Colors.green,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        Positioned(
          left: 2,
          bottom: 2,
          child: CircleAvatar(
            // radius: 16,
            backgroundColor: Colors.grey[200],
            child: IconButton(
              onPressed: () {
                context
                    .read<ProductBloc>()
                    .add(RemovwOrderFromBasketEvent(order: [order]));
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class OrderHistoryList extends StatelessWidget {
  const OrderHistoryList({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Map<String, dynamic> order;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(order["imgurl"]), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order['name'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(order['restaurant']),
                  const SizedBox(height: 5),
                  Text(order['toppings'].length > 0
                      ? "+${order['toppings']}"
                      : "")
                  //  ItemCounterWidget()
                  // Row(
                  //   children: List.generate(order["toppings"].length, (index) {
                  //     return Text("+" + order['toppings'][index]);
                  //   }),
                  // )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text("TL ${order['totalAmount']}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_half, color: Colors.amber)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
