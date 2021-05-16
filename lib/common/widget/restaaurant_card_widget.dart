import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/home/data/model/product.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    required this.onPressed,
    required this.product,
  }) : super(key: key);
  final Product product;
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
                image: DecorationImage(
                    image: NetworkImage(product.imgurl), fit: BoxFit.cover),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '25-30 min.',
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₺${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              product.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(product.restaurant),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '${product.rank}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.amber,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
