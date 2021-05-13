import 'dart:math';

import 'package:flutter/material.dart';

/*
#C452FC
#996CFC
#580282
#666EAF
#A4ACD4
#545454
*/
class KanbanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
      appBar: AppBar(
        title: Text(routes['title']!),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          CardItem(),
          CardItem(),
          CardItem(),
          CardItem(),
          CardItem(),
          CardItem()
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    return ClipPath(
      clipper: const ShapeBorderClipper(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromARGB(
                100,
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
              ),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'M',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                title: Text('Matematik',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                subtitle: Text('Logaritma',
                    style: TextStyle(
                      color: Colors.grey[600],
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 300,
                  )
                ],
              ),
            ),
            // Divider(
            //   indent: 70,
            // ),
            ListTile(
              title: const Text('Musa ŞAHİN'),
              dense: true,
              subtitle: Text(
                '15 dk. önce',
                style: Theme.of(context).textTheme.caption,
              ),
              trailing: const CircleAvatar(
                radius: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Text(
                        //       "Musa ŞAHİN",
                        //       style: Theme.of(context).textTheme.subtitle2,
                        //     ),
                        //     Text(
                        //       "15 dk. önce",
                        //       style: Theme.of(context).textTheme.caption,
                        //     ),
                        //     CircleAvatar(
                        //       radius: 15,
                        //       child: Text("MS",
                        //           style: Theme.of(context).textTheme.subtitle1),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Supplemental actions are represented by icons, text, and UI controls on cards. They are typically placed at the bottom of the card.',
                                style: Theme.of(context).textTheme.bodyText2,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            // RaisedButton(
                            //   onPressed: () {},
                            //   child: Text("Button"),
                            // ),
                            // SizedBox(width: 16),
                            // RaisedButton(
                            //   onPressed: () {},
                            //   child: Text("Button"),
                            // ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.favorite),
                            SizedBox(width: 16),
                            Icon(Icons.share),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
