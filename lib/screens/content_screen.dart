import 'package:flikk/model/provider_model.dart';
import 'package:flikk/screens/detail_screen.dart';
import 'package:flikk/widgets/animated_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  final String appbarTitle;

  const ContentPage({Key? key, required this.appbarTitle}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  Future? myFuture;

  @override
  void initState() {
    myFuture = Provider.of<MoviesProvider>(context, listen: false)
        .getData(widget.appbarTitle);

    super.initState();
  }

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
          child: FutureBuilder(
              future: myFuture,
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black54,
                        ),
                      )
                    : Container(
                        child: providerInstance.item.isEmpty
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
                                itemCount: providerInstance.item.length,
                                itemBuilder: (BuildContext ctx, indx) {
                                  return Consumer<MoviesProvider>(
                                    builder: (context, value, child) =>
                                        GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext ctx) =>
                                                  DetailScreen(
                                                    movie: value.item[indx],
                                                  ))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: GridTile(
                                          footer: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.9)),
                                            child: Center(
                                              child: Text(
                                                  value.item[indx].title,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
                                            ),
                                          ),
                                          child: Hero(
                                            tag:
                                                'heroTag-${value.item[indx].title}',
                                            child: Container(
                                              color: Colors.grey.shade400,
                                              child: Image.network(
                                                value.item[indx].image,
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
                                      ),
                                    ),
                                  );
                                },
                              ),
                      );
              }),
        ),
        floatingActionButton: AnimatedSearchBar(),
      ),
    );
  }
}
