import 'dart:convert';

import 'package:movie_db_flutter/models/actor_list_response.dart';

class MovieCastResponse {
  List<Actor> actors;

  MovieCastResponse({
    this.actors,
  });

  factory MovieCastResponse.fromRawJson(String str) =>
      MovieCastResponse.fromJson(json.decode(str));

  factory MovieCastResponse.fromJson(Map<String, dynamic> json) => new MovieCastResponse(
        actors:
            new List<Actor>.from(json["cast"].map((x) => Actor.fromJson(x))),
      );
}
