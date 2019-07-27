import 'package:flutter/material.dart';

import 'common/app_drawer.dart';
import 'common/movie_list.dart';

class Movies extends StatelessWidget {
  final String title;

  const Movies({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: MovieList(),
    );
  }
}
