import 'dart:convert';

import 'package:movie_db_flutter/models/movie_list_response.dart';

class ActorCastResponse {
  List<Movie> movies;

  ActorCastResponse({
    this.movies,
  });

  factory ActorCastResponse.fromRawJson(String str) =>
      ActorCastResponse.fromJson(json.decode(str));

  factory ActorCastResponse.fromJson(Map<String, dynamic> json) => new ActorCastResponse(
    movies:
            new List<Movie>.from(json["cast"].map((x) => Movie.fromJson(x))),
      );
}
