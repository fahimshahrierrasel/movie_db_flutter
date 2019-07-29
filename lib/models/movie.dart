import 'genres.dart';

class Movie {
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

  Movie.fromJsonMap(Map<String, dynamic> map)
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['belongs_to_collection'] = belongsToCollection;
    data['budget'] = budget;
    data['genres'] =
        genres != null ? this.genres.map((v) => v.toJson()).toList() : null;
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagLine;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
