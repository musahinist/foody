import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      leading: const Icon(
        CupertinoIcons.slider_horizontal_3,
        color: Colors.amber,
      ),
      elevation: 0,
      title: SizedBox(
        height: 32,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              suffixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey[900],
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.lightGreen[50],
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: 'Search...'),
        ),
      ),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.all(16),
      //     child: Icon(
      //       CupertinoIcons.search,
      //       color: Colors.black,
      //     ),
      //   ),
      // ],
    );
  }
}
