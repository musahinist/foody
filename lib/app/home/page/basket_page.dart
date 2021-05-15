import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../common/widget/item_counter_widget.dart';
import '../../checkout/page/checkout_page.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = 'Basket';
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Basket'),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('3 items Selected',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  OrderSummaryList(),
                  OrderSummaryList(),
                  OrderSummaryList(),
                ],
              ),
            ),
            const ListTile(
              dense: true,
              subtitle: Text('SubTotal'),
              trailing: Text('TL 135.00'),
            ),
            const ListTile(
              dense: true,
              subtitle: Text('Delivery Charge'),
              trailing: Text('Free Delivery'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Total Amount'),
              trailing: Text('TL 135.00',
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
        ));
  }
}

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({
    Key? key,
  }) : super(key: key);

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  const Text('Cheese Burger'),
                  const SizedBox(height: 5),
                  ItemCounterWidget()
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('TL 45.00',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
