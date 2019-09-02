import 'dart:convert';

class MovieListResponse {
  int page;
  List<Movie> movies;
  int totalResults;
  int totalPages;

  MovieListResponse({
    this.page,
    this.movies,
    this.totalResults,
    this.totalPages,
  });

  factory MovieListResponse.fromRawJson(String str) => MovieListResponse.fromJson(json.decode(str));

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => new MovieListResponse(
    page: json["page"],
    movies: new List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
  );
}

class Movie {
  String posterPath;
  DateTime releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String title;
  double voteAverage;

  Movie({
    this.posterPath,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.title,
    this.voteAverage,
  });

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalTitle: json["original_title"],
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
  );
}
