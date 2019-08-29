import 'package:flutter/material.dart';
import 'package:movie_db_flutter/screens/movie_details.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(
                      movieId: 1,
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
                      image: AssetImage("assets/images/lion_king_poster.jpg"),
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
