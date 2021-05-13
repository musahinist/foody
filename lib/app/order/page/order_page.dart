import 'package:flutter/material.dart';
import 'package:foody/app/order/page/map_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Order State"),
          icon: Icon(Icons.delivery_dining),
          onPressed: () {
            showBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[50],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Wrap(
                        children: const [
                          ListTile(
                              leading: Icon(Icons.timelapse_sharp,
                                  color: Colors.amber),
                              title: Text('Delivery Time',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              trailing: Text('10 min',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          Divider(),
                          ListTile(
                            leading: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            title: Text('Order Confirmed'),
                            subtitle: Text('Your order has been recevied'),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            title: Text('Delivery Prepared'),
                            subtitle: Text('Your order has been prepared'),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.update,
                              // color: Colors.green,
                            ),
                            title: Text('Delivery In Porgress'),
                            subtitle: Text('Hang on! Your food i on the way'),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Positioned.fill(
              child: MapSample(),
            ),
            // Container(
            //   height: 400,
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('asset/image/map.jpg'),
            //           fit: BoxFit.fitWidth)),
            //   //   color: Colors.red,
            // ),
          ],
        ));
  }
}
