import 'package:flutter/material.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/actor_list_response.dart';
import 'package:movie_db_flutter/screens/actor_details_page.dart';

class ActorGridItem extends StatelessWidget {
  final Actor actor;

  const ActorGridItem({
    Key key,
    this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActorDetailsPage(
                      actorId: actor.id,
                    )));
      },
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(4.0),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                "$castProfilePrefix/${actor.profilePath}",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(255, 255, 255, 0.7),
                child: Text(
                  actor.name,
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
