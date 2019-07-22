import 'package:flutter/material.dart';

import 'MovieItemCard.dart';

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
