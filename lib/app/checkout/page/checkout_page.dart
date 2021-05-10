import 'package:flutter/material.dart';
import '../../home/page/home_page.dart';
import 'package:get/route_manager.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = 'checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.amber, Colors.purple]),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Musa ŞAHIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "TL 135.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text("5/25")
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.place),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            Text(
                "Göztepe mahallesi Fahrettin Kerim Gökay Caddesi Özlem Sok No:30 Kadıköy İSTANBUL"),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(HomePage.$PATH);
                Get.dialog(
                  Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 80,
                          ),
                          SizedBox(height: 24),
                          Text(
                              "Your payment has been made successfully, you can follow the order details from the Order tab."),
                        ],
                      ),
                    ),
                  ),
                );
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
          ],
        ),
      ),
    );
  }
}
