class Movie{
  Movie({required this.id, required this.name, required this.year, required this.duration, required this.description, required this.gender, required this.urlImage});

  final int id;
  final String name;
  final int year;
  final int duration;
  final String description;
  final String gender;
  final String urlImage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['id'],
    name: json['name'],
    year: json['year'],
    duration : json['duration'],
    description: json['description'],
    gender: json['gender'],
    urlImage: json['url_image'],
  );
}