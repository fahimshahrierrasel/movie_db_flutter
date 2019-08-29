import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_flutter/common/actor_item.dart';
import 'package:movie_db_flutter/common/app_drawer.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/actor_list_response.dart';

Future<ActorResponse> getActorList({int page = 1}) async {
  final response =
      await http.get("$baseUrl/person/popular?api_key=$apiKey&page=$page");

  if (response.statusCode == 200) {
    return ActorResponse.fromRawJson(response.body);
  } else {
    throw Exception("Failed to load actors");
  }
}

class Actors extends StatelessWidget {
  final String title;

  const Actors({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder<ActorResponse>(
          future: getActorList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: snapshot.data.actors.map((actor) {
                  return ActorListItem(actorName: actor.name, actorImage: actor.profilePath,);
                }).toList(),
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
          },
        ));
  }
}
