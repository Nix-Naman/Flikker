// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      title: json['title'] as String,
      release: json['release'] as String,
      genere: json['genere'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      language: json['language'] as String,
      runtime: json['runtime'] as String,
      image: json['image'] as String,
      trailer: json['trailer'] as String,
      url480: json['url480'] as String,
      url720: json['url720'] as String,
      url1080: json['url1080'] as String,
    );

// Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
//       'title': instance.title,
//       'release': instance.release,
//       'genere': instance.genere,
//       'description': instance.description,
//       'rating': instance.rating,
//       'language': instance.language,
//       'runtime': instance.runtime,
//       'image': instance.image,
//       'url480': instance.url480,
//       'url720': instance.url720,
//       'url1080': instance.url1080,
//     };
