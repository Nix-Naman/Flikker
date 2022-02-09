import 'package:flikk/model/provider_model.dart';
import 'package:flikk/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/movie_model.dart';

class ContentPage extends StatefulWidget {
  final String appbarTitle;

  const ContentPage({Key? key, required this.appbarTitle}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  static const List<String> filters = [
    "Action",
    "Adventure",
    "Drama",
    "Thriller",
    "Hindi",
    "English",
    "Dual Audio",
    "Romance",
  ];
  @override
  Widget build(BuildContext context) {
    final providerInstance = Provider.of<MoviesProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
              )),
          title: Text(
            widget.appbarTitle,
            style: TextStyle(fontSize: 32, fontFamily: "ReemKufi"),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              FutureBuilder(
                  future: providerInstance.getData(widget.appbarTitle),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? Center(
                            child: CircularProgressIndicator(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black54,
                            ),
                          )
                        : Container(
                            child: providerInstance.movieList.isEmpty
                                ? Column(
                                    children: [
                                      Image.asset(MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.dark
                                          ? "assets/images/Search-dark.gif"
                                          : "assets/images/Search.gif"),
                                      Text(
                                        "No data Found",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ],
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                            childAspectRatio: 0.75),
                                    itemCount:
                                        providerInstance.movieList.length,
                                    itemBuilder: (BuildContext ctx, indx) {
                                      return GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext ctx) =>
                                                    DetailScreen(
                                                      movie: providerInstance
                                                          .movieList[indx],
                                                    ))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: GridTile(
                                            footer: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.9)),
                                              child: Center(
                                                child: Text(
                                                    providerInstance
                                                        .movieList[indx].title,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20)),
                                              ),
                                            ),
                                            child: Hero(
                                              tag:
                                                  'heroTag-${providerInstance.movieList[indx].title}',
                                              child: Image.network(
                                                providerInstance
                                                    .movieList[indx].image,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black54,
                                                    ),
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
