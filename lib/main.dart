import 'package:flutter/material.dart';

import 'package:movie_db_flutter/screens/movies_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesListPage(
        title: "Popular Movies",
        keyword: "popular",
      ),
    );
  }
}


