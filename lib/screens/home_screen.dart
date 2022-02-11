import 'package:card_swiper/card_swiper.dart';

import 'package:flikk/screens/content_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List title = [
    "anime.png",
    'movie.png',
    'tv.jpeg',
    'snam.jpg',
    'anime.png'
  ];
  @override
  Widget build(BuildContext context) {
    // MoviesProvider().getData("Anime");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flikker",
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'ReemKufi',
            ),
          ),
          centerTitle: true,
          leading: Container(
              child: Image.asset(
            'assets/images/menu.png',
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Trending",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.23)),
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: 5,
                autoplay: true,
                autoplayDelay: 5000,
                index: 0,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.grey,
                    )),
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/${title[index]}")),
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Spacer(),
            ContentCard(title: "Movies", img: "movie.png"),
            Spacer(),
            ContentCard(title: "TV Show", img: "tv.jpeg"),
            Spacer(),
            ContentCard(title: "Anime", img: "anime.png"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String title;
  final String img;

  const ContentCard({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContentPage(appbarTitle: title),
        )),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/$img"),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: 46,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
