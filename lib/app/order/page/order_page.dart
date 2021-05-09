import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/image/map.jpg"),
                        fit: BoxFit.fitWidth)),
                //   color: Colors.red,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                        leading:
                            Icon(Icons.timelapse_sharp, color: Colors.amber),
                        title: Text("Delivery Time",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        trailing: Text("10 min",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text("Order Confirmed"),
                      subtitle: Text("Your order has been recevied"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text("Delivery Prepared"),
                      subtitle: Text("Your order has been prepared"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.update,
                        // color: Colors.green,
                      ),
                      title: Text("Delivery In Porgress"),
                      subtitle: Text("Hang on! Your food i on the way"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
