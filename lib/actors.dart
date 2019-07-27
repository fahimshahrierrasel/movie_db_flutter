import 'package:flutter/material.dart';

import 'common/actor_item.dart';
import 'common/app_drawer.dart';

class Actors extends StatelessWidget {
  final String title;

  const Actors({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(21, (index) {
          return ActorListItem();
        }),
      ),
    );
  }
}
