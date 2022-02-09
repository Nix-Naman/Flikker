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
    required this.url480,
    required this.url720,
    required this.url1080,
  });
  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}

List<Movies> movies = [
  Movies(
    title: "Intersteller",
    release: "2014",
    genere: "Sifi,Adventure",
    description:
        "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.",
    rating: 8.6,
    language: "English",
    runtime: "2hr 49min",
    url480:
        "https://veryfastdownload.pw/download.php?link=aHR0cHM6Ly9waG90b3MuYXBwLmdvby5nbC9VWHZTTFpocmhqYjhXTW84Nw==",
    url720:
        "https://veryfastdownload.pw/download.php?link=aHR0cHM6Ly9waG90b3MuYXBwLmdvby5nbC9VWHZTTFpocmhqYjhXTW84Nw==",
    url1080:
        "https://veryfastdownload.pw/download.php?link=aHR0cHM6Ly9waG90b3MuYXBwLmdvby5nbC9qVjlhWUpxWFBBU2dSdWtVNg==",
    image:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRf61mker2o4KH3CbVE7Zw5B1-VogMH8LfZHEaq3UdCMLxARZAB",
  ),
  Movies(
    title: "Snowden",
    release: "2016",
    genere: "Thriller,Drama ",
    description: "",
    rating: 8.7,
    language: "English",
    runtime: "2hr 14min",
    image:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBMhlaVE1TXq5aw44RY5o7NmatHS_H-52Rp2F0K8Xm1pjwzccm",
    url480: "",
    url720: "",
    url1080: "",
  ),
  Movies(
    title: "The imitation game",
    release: "2014",
    genere: "War Drama",
    url480: "",
    url720: "",
    url1080: "",
    description:
        "Alan Turing, a British mathematician, joins the cryptography team to decipher the German enigma code. With the help of his fellow mathematicians, he builds a machine to crack the codes.",
    rating: 8.0,
    language: "English",
    runtime: "1hr 54min",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5OX3nnCexvNU309_rCIQNFScQL3e2l87PBpXEh5hjP9Y1xxeH",
  ),
];
