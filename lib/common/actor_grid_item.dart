import 'package:flutter/material.dart';
import 'package:movie_db_flutter/helpers/constants.dart';

import 'package:movie_db_flutter/screens/actor_details_page.dart';

class ActorGridItem extends StatelessWidget {
  final String actorName;
  final String actorImage;

  const ActorGridItem({
    Key key,
    this.actorName,
    this.actorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActorDetailsPage(
                      title: actorName,
                    )));
      },
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(4.0),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("$castProfilePrefix/$actorImage"),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(255, 255, 255, 0.7),
                child: Text(
                  actorName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
