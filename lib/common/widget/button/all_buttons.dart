import 'package:flutter/material.dart';

class AllButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10,
        children: <Widget>[
          //-1-
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red)),
            color: Colors.white,
            textColor: Colors.red,
            onPressed: () {},
            child: Text(
              'Add to Cart'.toUpperCase(),
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          //-2-
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red)),
            onPressed: () {},
            //color: Colors.red,
            textColor: Colors.white,
            child: Text('Buy now'.toUpperCase(),
                style: const TextStyle(fontSize: 14)),
          ),
          //-3-
          OutlineButton.icon(
            shape: const BeveledRectangleBorder(
                //side: BorderSide(width: 0.3, color: Colors.grey),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
            // shape: StadiumBorder(),
            onPressed: () {},
            //color: Colors.grey[900],
            label: const Text(
              'code',
              style: TextStyle(color: Colors.amber),
            ),
            icon: const Icon(
              Icons.code,
              color: Colors.blue,
            ),
          ),
          //-4-
          FlatButton.icon(
            shape: const BeveledRectangleBorder(
                side: BorderSide(width: 0.3, color: Colors.grey),
                borderRadius:
                    BorderRadius.only(topRight: Radius.elliptical(10, 10))),
            // shape: StadiumBorder(),
            onPressed: () {},
            //color: Colors.grey[900],
            label: const Text(
              'code',
              style: TextStyle(color: Colors.amber),
            ),
            icon: const Icon(
              Icons.code,
              color: Colors.blue,
            ),
          ),
          //-5-
          FlatButton.icon(
            shape: const BeveledRectangleBorder(
                borderRadius:
                    BorderRadius.only(topRight: Radius.elliptical(10, 10))),
            // shape: StadiumBorder(),
            onPressed: () {},
            color: Colors.grey,
            label: const Text(
              'code',
              style: TextStyle(color: Colors.amber),
            ),
            icon: const Icon(
              Icons.code,
              color: Colors.white,
            ),
          ),
          //-6-
          OutlineButton(
            shape: const StadiumBorder(),
            textColor: Colors.blue,
            borderSide: const BorderSide(color: Colors.blue),
            onPressed: () {},
            child: const Text('Button Text'),
          ),
          //-7-
          OutlineButton(
            onPressed: null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: const Text('Butn text'),
          ),
          //-8-
          FlatButton.icon(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            onPressed: () {},
            color: Colors.grey[900],
            label: const Text(
              'code',
              style: TextStyle(color: Colors.amber),
            ),
            icon: const Icon(
              Icons.code,
              color: Colors.blue,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              //width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Click Me',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: RaisedButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ),
          ClipOval(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ),
          RaisedButton(
            shape: StadiumBorder(),
            onPressed: () {},
            child: Text('Button'),
          ),
          Container(
            width: 130.0,
            height: 43.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.9],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Color(0xff1d83ab),
                  Color(0xff0cbab8),
                ],
              ),
            ),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          MaterialButton(
            height: 58,
            minWidth: 340,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {},
            color: const Color(0xFFF7CA18),
            child: const Text(
              'CONVERT',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
