import 'package:flutter/material.dart';
import 'package:movie_db_flutter/common/app_drawer.dart';
import 'package:movie_db_flutter/common/movie_list.dart';

class MoviesListPage extends StatelessWidget {
  final String title;
  final String keyword;

  const MoviesListPage({Key key, @required this.title, @required this.keyword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: MovieList(
        movieResponse: getMovies(keyword),
      ),
    );
  }
}
