import 'package:flutter/material.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: Container(
        height: 180.0,
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: Image.asset(
                  "assets/images/lion_king_poster.jpg",
                  fit: BoxFit.cover,
                ),
                flex: 1,
              ),
              new Expanded(
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
                            "The Lion King",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text("Release Date"),
                                    new Text(
                                      "2019-07-12",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                              new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text("Rating"),
                                    new Text(
                                      "7.0",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])
                            ])
                      ]),
                ),
                flex: 2,
              )
            ]),
      ),
    );
  }
}
