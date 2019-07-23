import 'package:flutter/material.dart';

import 'MovieList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiscoverMovies(title: 'Movie DB'),
    );
  }
}

class DiscoverMovies extends StatefulWidget {
  DiscoverMovies({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverMoviesState createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover Movies"),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpansionTile(
              title: Text("Discover Movies"),
              children: <Widget>[Text("Hello"), Text("World")],
            ),
            Expanded(child: MovieList())
          ],
        ),
      ),
    );
  }
}
