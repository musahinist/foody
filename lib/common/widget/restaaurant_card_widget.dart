import 'dart:ui';

import 'package:flutter/material.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(32),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg')),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 136,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.amber[300],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32)),
                  ),
                  child: const Center(
                      child: Text(
                    '25-30 min.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Big Burger',
                style: Theme.of(context).textTheme.headline6,
              ),
              FlatButton.icon(
                  label: const Text('4.7'),
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onPressed: () {}),
            ],
          ),
          Row(
            children: const [
              Text('Burgers - Snacks'),
              SizedBox(width: 16),
              Text('₺'),
              Text('₺'),
              Text('₺')
            ],
          )
        ],
      ),
    );
  }
}
