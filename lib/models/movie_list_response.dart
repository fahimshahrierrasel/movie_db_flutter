class MovieListResponse {
  final int page;
  final List<Movie> results;
  final int totalResults;
  final int totalPages;

  MovieListResponse.fromJsonMap(Map<String, dynamic> map)
      : page = map["page"],
        results =
            List<Movie>.from(map["results"].map((it) => Movie.fromJsonMap(it))),
        totalResults = map["total_results"],
        totalPages = map["total_pages"];
}

class Movie {
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String title;
  final double voteAverage;

  Movie.fromJsonMap(Map<String, dynamic> map)
      : posterPath = map["poster_path"],
        releaseDate = map["release_date"],
        genreIds = List<int>.from(map["genre_ids"]),
        id = map["id"],
        originalTitle = map["original_title"],
        title = map["title"],
        voteAverage = map["vote_average"].toDouble();
}
