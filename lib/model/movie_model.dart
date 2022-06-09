import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class Movies {
  final String title;
  final String release;
  final String genere;
  final String description;
  final double rating;
  final String language;
  final String runtime;
  final String image;
  final String trailer;
  final String url480;
  final String url720;
  final String url1080;
  Movies({
    required this.title,
    required this.release,
    required this.genere,
    required this.description,
    required this.rating,
    required this.language,
    required this.runtime,
    required this.image,
    required this.trailer,
    required this.url480,
    required this.url720,
    required this.url1080,
  });
  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
