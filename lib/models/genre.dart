
class Genre {
  int id;
  String name;

	Genre.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		name = map["name"];
}
