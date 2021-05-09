import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      backgroundColor: Colors.lightGreen[50],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  child: SvgPicture.asset(
                    'asset/svg/dots.svg',
                  ),
                ),
                const SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: 0.8,
                    strokeWidth: 10,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.lightGreen[50],
                  radius: 67,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://styles.redditmedia.com/t5_dz9jg/styles/profileIcon_imbb9n6vnfb01.jpg?width=256&height=256&crop=256:256,smart&frame=1&s=2b31e594284836323836cf8b6c772156e609769d'),
                    backgroundColor: Colors.blue,
                    radius: 60,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Musa Şahin',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 16),
          RaisedButton.icon(
              icon: const Icon(
                Icons.point_of_sale,
                color: Colors.amber,
              ),
              shape: const StadiumBorder(),
              color: Colors.white,
              label: Text(
                '3600 points',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onPressed: () {}),
          const SizedBox(height: 16),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('General'),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      ExpansionTile(
                        leading: Icon(Icons.directions_bike),
                        title: Text('My Orders'),
                        children: [
                          ListTile(
                            title: Text('Order 1'),
                          )
                        ],
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile Settings'),
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.payment),
                        title: Text('Payment'),
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Notifications'),
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.directions_bike),
                        title: Text('My Orders'),
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.directions_bike),
                        title: Text('My Orders'),
                      ),
                      ExpansionTile(
                        leading: Icon(Icons.directions_bike),
                        title: Text('My Orders'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
