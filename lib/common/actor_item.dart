import 'package:flutter/material.dart';

import 'package:movie_db_flutter/screens/actor_details.dart';

class ActorListItem extends StatelessWidget {
  const ActorListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActorDetails(
                  title: "The Actor",
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
                      image: AssetImage("assets/images/donald_glover.jpg"),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(255, 255, 255, 0.7),
                child: Text(
                  "The Lion King",
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
