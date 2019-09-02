import 'package:flutter/material.dart';
import 'package:movie_db_flutter/models/movie_list_response.dart';

import 'package:movie_db_flutter/screens/movie_details_page.dart';
import 'package:movie_db_flutter/helpers/constants.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(
                        movieId: movie.id,
                      )));
        },
        child: Container(
          height: 180.0,
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/placeholder.png",
                    image: "$posterPrefix/${movie.posterPath}",
                    fit: BoxFit.cover,
                    alignment: AlignmentDirectional.center,
                  ),
                  flex: 1,
                ),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    padding: EdgeInsets.all(8.0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                          new Text(
                            "Adventure, Animation, Family, Drama, Action",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Release Date"),
                                      new Text(
                                        movie.releaseDate.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Rating"),
                                      new Text(
                                        movie.voteAverage.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])
                              ])
                        ]),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
