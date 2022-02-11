import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikk/model/movie_model.dart';
import 'package:flutter/cupertino.dart';

class MoviesProvider with ChangeNotifier {
  final firestoreInstance = FirebaseFirestore.instance;
  List<Movies> contentList = [];
  List<Movies> item = [];
  Future<void> getData(String tag) async {
    contentList.clear();
    if (tag == "Movies") {
      await firestoreInstance.collection("Movies").get().then((value) {
        value.docs.forEach((element) {
          Movies movie = Movies.fromJson(element.data());
          contentList.add(movie);
        });
      });
      item.addAll(contentList);
    } else if (tag == "TV Show") {
      item.clear();
    } else if (tag == 'Anime') {
      item.clear();
    }
  }

  void filter(String query) {
    item = contentList.where((i) {
      var title = i.title.toLowerCase();
      return title.contains(query);
    }).toList();
    print(item[0].title);
    notifyListeners();
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