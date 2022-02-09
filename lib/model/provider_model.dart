import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikk/model/movie_model.dart';
import 'package:flutter/cupertino.dart';

class MoviesProvider with ChangeNotifier {
  final firestoreInstance = FirebaseFirestore.instance;
  List<Movies> movieList = [];
  List<Movies> filteredmovieList = [];
  Future<void> getData(String tag) async {
    movieList.clear();
    if (tag == "Movies") {
      await firestoreInstance.collection("Movies").get().then((value) {
        value.docs.forEach((element) {
          Movies movie = Movies.fromJson(element.data());
          movieList.add(movie);
        });
      });
    } else if (tag == "Tv-show") {
    } else if (tag == 'Anime') {}
  }
}

//  print("title: ${movie.title}");
//         print("desc: ${movie.description}");
//         print("rating: ${movie.rating}");
//         print("release: ${movie.release}");
//         print("runtime: ${movie.runtime}");
//         print("genere: ${movie.genere}");
//         print("language: ${movie.language}");
//         print("image: ${movie.image}");
//         print("url480: ${movie.url480}");
//         print("url720:${movie.url720}");
//         print("url1080:${movie.url1080}");