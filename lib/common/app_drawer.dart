import 'package:flutter/material.dart';

import 'package:movie_db_flutter/screens/actors.dart';
import 'package:movie_db_flutter/screens/discover_movies.dart';
import 'package:movie_db_flutter/screens/movies.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Movie DB'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Popular Movies'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Movies(
                            title: "Popular Movies",
                            keyword: "popular",
                          )));
            },
          ),
          ListTile(
            title: Text('Now Playing'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Movies(
                            title: "Now Playing",
                            keyword: "now_playing",
                          )));
            },
          ),
          ListTile(
            title: Text('Discover Movies'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiscoverMovies(
                            title: "Discover Movies",
                          )));
            },
          ),
          ListTile(
            title: Text('Top Rated Movies'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Movies(
                            title: "Top Rated Movies",
                            keyword: "top_rated",
                          )));
            },
          ),
          ListTile(
            title: Text('Upcoming Movies'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Movies(
                            title: "Upcoming Movies",
                            keyword: "upcoming",
                          )));
            },
          ),
          ListTile(
            title: Text('Actors'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Actors(
                            title: "Actors",
                          )));
            },
          ),
        ],
      ),
    );
  }
}
