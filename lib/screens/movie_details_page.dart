import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_flutter/common/actor_grid_item.dart';
import 'package:movie_db_flutter/common/fact_item.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/movie_details.dart';

Future<MovieDetails> getMovieDetails(String movieId, String apiKey) async {
  final response = await http.get('$baseUrl/movie/$movieId?api_key=$apiKey');

  if (response.statusCode == 200) {
    return MovieDetails.fromJsonMap(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  MovieDetailsPage({Key key, @required this.movieId}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState(
      movieDetailsResponse: getMovieDetails(movieId.toString(), apiKey));
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  var top = 0.0;
  final Future<MovieDetails> movieDetailsResponse;

  _MovieDetailsPageState({@required this.movieDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<MovieDetails>(
      future: movieDetailsResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var movie = snapshot.data;
          String movieTitle = movie.title.length > 25
              ? movie.title.substring(0, 25) + '...'
              : movie.title;
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    floating: true,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        centerTitle: false,
                        collapseMode: CollapseMode.parallax,
                        title: Text(top <= 100 ? movieTitle : ""),
                        background: FadeInImage.assetNetwork(
                          placeholder: "assets/images/placeholder.png",
                          image: "$backdropPrefix/${movie.backdropPath}",
                          fit: BoxFit.cover,
                        ),
                      );
                    }))
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            movie.overview,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Facts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        new FactItem(Icons.theaters, movie.status),
                        new FactItem(Icons.today, movie.releaseDate),
                        new FactItem(Icons.language, movie.originalLanguage),
                        new FactItem(
                            Icons.movie,
                            movie.runtime != null
                                ? "${(movie.runtime / 60).round()} hrs ${(movie.runtime % 60).toString()} mins"
                                : ""),
                        new FactItem(
                            Icons.monetization_on, "${movie.budget/1000000} Million"),
                        new FactItem(
                            Icons.trending_up, "${movie.revenue/1000000} Million"),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Top Billed Cast",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 160,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, int) {
                                return ActorGridItem();
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
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
            )),
          );
        }
      },
    ));
  }
}
