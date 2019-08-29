import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_db_flutter/common/movie_list_item.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/movie_list_response.dart';

Future<MovieListResponse> getMovies(String keyword) async {
  final response =
      await http.get('$baseUrl/movie/$keyword?api_key=$apiKey&page=1');

  if (response.statusCode == 200) {
    return MovieListResponse.fromJsonMap(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class MovieList extends StatelessWidget {
  final Future<MovieListResponse> movieResponse;

  const MovieList({Key key, this.movieResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieListResponse>(
        future: movieResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movies = snapshot.data.results;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, position) {
                return MovieListItem(movie: movies[position]);
              },
            );
          } else {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ));
          }
        });
  }
}
