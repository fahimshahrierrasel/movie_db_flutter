import 'package:flutter/material.dart';

import 'package:movie_db_flutter/screens/movies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Movies(
        title: "Discover Movies",
      ),
    );
  }
}


