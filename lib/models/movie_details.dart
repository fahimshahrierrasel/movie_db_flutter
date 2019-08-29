import 'genre.dart';

class MovieDetails {
  bool adult;
  String backdropPath;
  Object belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  Object posterPath;
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagLine;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetails.fromJsonMap(Map<String, dynamic> map)
      : adult = map["adult"],
        backdropPath = map["backdrop_path"],
        belongsToCollection = map["belongs_to_collection"],
        budget = map["budget"],
        genres =
            List<Genre>.from(map["genres"].map((it) => Genre.fromJsonMap(it))),
        homepage = map["homepage"],
        id = map["id"],
        imdbId = map["imdb_id"],
        originalLanguage = map["original_language"],
        originalTitle = map["original_title"],
        overview = map["overview"],
        popularity = map["popularity"],
        posterPath = map["poster_path"],
        releaseDate = map["release_date"],
        revenue = map["revenue"],
        runtime = map["runtime"],
        status = map["status"],
        tagLine = map["tagline"],
        title = map["title"],
        video = map["video"],
        voteAverage = map["vote_average"].toDouble(),
        voteCount = map["vote_count"];
}
