import 'package:flutter/material.dart';
import 'package:movie_db_flutter/helpers/constants.dart';
import 'package:movie_db_flutter/models/movie_list_response.dart';
import 'package:movie_db_flutter/screens/movie_details_page.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;

  const MovieGridItem({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsPage(
                      movieId: movie.id,
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
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/placeholder.png",
                  image: "$posterPrefix/${movie.posterPath}",
              fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(255, 255, 255, 0.7),
                child: Text(
                  movie.title,
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
