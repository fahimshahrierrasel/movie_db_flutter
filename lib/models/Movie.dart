class Movie {
  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movie.fromJsonMap(Map<String, dynamic> map)
      : posterPath = map["poster_path"],
        adult = map["adult"],
        overview = map["overview"],
        releaseDate = map["release_date"],
        genreIds = List<int>.from(map["genre_ids"]),
        id = map["id"],
        originalTitle = map["original_title"],
        originalLanguage = map["original_language"],
        title = map["title"],
        backdropPath = map["backdrop_path"],
        popularity = map["popularity"],
        voteCount = map["vote_count"],
        video = map["video"],
        voteAverage = map["vote_average"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = posterPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['original_language'] = originalLanguage;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    return data;
  }
}