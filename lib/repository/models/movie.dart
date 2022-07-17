class Movie {
  final int? id;
 final String? statesName;
 

  const Movie({this.id, this.statesName, });
  static const empty = Movie(
      statesName: "",
  );
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(id: json['id'], statesName: json['states_name']);
  }

  
}
