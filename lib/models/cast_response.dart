import 'dart:convert';

import 'package:movie_db_flutter/models/actor_list_response.dart';

class CastResponse {
  List<Actor> actors;

  CastResponse({
    this.actors,
  });

  factory CastResponse.fromRawJson(String str) =>
      CastResponse.fromJson(json.decode(str));

  factory CastResponse.fromJson(Map<String, dynamic> json) => new CastResponse(
        actors:
            new List<Actor>.from(json["cast"].map((x) => Actor.fromJson(x))),
      );
}
