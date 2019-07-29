import 'Movie.dart';

class MovieResponse {
  final int page;
  final List<Movie> results;
  final int totalResults;
  final int totalPages;

  MovieResponse.fromJsonMap(Map<String, dynamic> map)
      : page = map["page"],
        results =
            List<Movie>.from(map["results"].map((it) => Movie.fromJsonMap(it))),
        totalResults = map["total_results"],
        totalPages = map["total_pages"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = page;
    data['results'] =
        results != null ? this.results.map((v) => v.toJson()).toList() : null;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }
}
