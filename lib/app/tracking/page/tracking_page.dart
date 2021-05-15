import 'package:flutter/material.dart';

import 'map_widget.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({
    Key? key,
  }) : super(key: key);
  static const String $PATH = '/Tracking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: MapSample(),
            ),
          ),
          // Container(
          //   height: 400,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('asset/image/map.jpg'),
          //           fit: BoxFit.fitWidth)),
          //   //   color: Colors.red,
          // ),
          DraggableScrollableSheet(
            // expand: true,
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.45,
            builder: (contex, scrollctrl) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: ListView(
                    controller: scrollctrl,
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      ListTile(
                          leading:
                              Icon(Icons.timelapse_sharp, color: Colors.amber),
                          title: Text('Delivery Time',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: Text('10 min',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
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
            },
          ),
        ],
      ),
    );
  }
}
