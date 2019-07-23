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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Search Here"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                                child: Text("Search"), onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ExpansionTile(
                        title: Text("Advance Search"),
                        children: <Widget>[
                          new DropdownButton<String>(
                            items: <String>["2017", "2016"].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                          Slider(value: 100, min: 0, max: 100, onChanged: null)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: MovieList())
          ],
        ),
      ),
    );
  }
}
