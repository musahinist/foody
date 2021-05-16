import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.imgurl,
  }) : super(key: key);
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    //  DimensionConfig().init(context);
    return SliverAppBar(
      expandedHeight: 200.0,
      backgroundColor: Colors.amber,
      elevation: 0, automaticallyImplyLeading: false,
      pinned: true,

      flexibleSpace: FlexibleSpaceBar(
        title:
            const Text('Burger Story', style: TextStyle(color: Colors.white)),
        // Image(
        //   image: NetworkImage(
        //     "https://image.freepik.com/free-vector/burger-logo_1366-144.jpg",
        //   ),
        // ),
        // titlePadding: EdgeInsetsDirectional.only(top: 150),

        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(
            //   color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(
                imgurl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      //  toolbarHeight: 56,
    );
  }
}
