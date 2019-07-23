import 'package:flutter/material.dart';

import 'discover_movies.dart';
import 'movie_details.dart';
import 'movies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDetails(
        title: "Discover Movies",
      ),
    );
  }
}


