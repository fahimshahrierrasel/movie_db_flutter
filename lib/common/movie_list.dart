import 'package:flutter/material.dart';

import 'package:movie_db_flutter/common/movie_item_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, int) {
        return MovieItemCard();
      },
    );
  }
}
