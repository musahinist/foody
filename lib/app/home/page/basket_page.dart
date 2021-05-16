import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/app/product/bloc/product_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/item_counter_widget.dart';
import '../../checkout/page/checkout_page.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);
  static const String $PATH = 'Basket';

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  var orders = [];

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
              return _Body(orders: state.orders.data()!["orders"]);
            }
            return _Body(orders: orders);
          },
        ));
  }
}

class _Body extends StatelessWidget {
  final List orders;

  const _Body({Key? key, required this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double totalPayment = 0;
    orders.forEach((order) {
      totalPayment += order["totalAmount"];
    });
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('3 items Selected',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(CheckoutPage.$PATH);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber[700]),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('CheckOut'),
              ),
            ),
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
                children: [
                  Text(order['name']),
                  const SizedBox(height: 5),
                  ItemCounterWidget()
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("TL ${order['totalAmount']}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<ProductBloc>()
                          .add(RemovwOrderFromBasketEvent(order: order));
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
