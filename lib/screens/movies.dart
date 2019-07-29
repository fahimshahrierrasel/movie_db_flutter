import 'package:flutter/material.dart';
import 'package:movie_db_flutter/common/app_drawer.dart';
import 'package:movie_db_flutter/common/movie_list.dart';

class Movies extends StatefulWidget {
  final String title;

  const Movies({Key key, @required this.title}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState(title: title);
}

class _MoviesState extends State<StatefulWidget> {
  final String title;

  _MoviesState({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: MovieList(),
    );
  }
}
