import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_flutter/common/fact_item.dart';
import 'package:movie_db_flutter/common/movie_grid_item.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/actor_details.dart';

Future<ActorDetails> getActorDetails(int actorId) async {
  final response = await http.get("$baseUrl/person/$actorId?api_key=$apiKey");

  if (response.statusCode == 200) {
    return ActorDetails.fromRawJson(response.body);
  } else {
    throw Exception("Failed to get actor details");
  }
}

class ActorDetailsPage extends StatefulWidget {
  ActorDetailsPage({Key key, this.actorId}) : super(key: key);

  final int actorId;

  @override
  _ActorDetailsPageState createState() =>
      _ActorDetailsPageState(actorDetailsResponse: getActorDetails(actorId));
}

class _ActorDetailsPageState extends State<ActorDetailsPage> {
  var top = 0.0;
  final Future<ActorDetails> actorDetailsResponse;

  _ActorDetailsPageState({@required this.actorDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ActorDetails>(
      future: actorDetailsResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ActorDetails actorDetails = snapshot.data;
          print(actorDetails);
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 350,
                    pinned: true,
                    floating: true,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.parallax,
                        title: Text(top <= 100 ? actorDetails.name : ""),
                        background: Image.network(
                          "$actorDetailsImagePrefix/${actorDetails.profilePath}",
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
                            "Biography",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            actorDetails.biography,
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
                            "Info",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        new FactItem(
                            Icons.today, actorDetails.birthday.toString()),
                        new FactItem(Icons.home, actorDetails.placeOfBirth),
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
                            "Known For",
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
                                return MovieGridItem();
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
