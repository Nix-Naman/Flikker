import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/movie_model.dart';

class DetailScreen extends StatelessWidget {
  final Movies movie;
  DetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'heroTag-${movie.title}',
              child: Container(
                width: _width,
                height: _height * 0.40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(movie.image)),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white.withOpacity(0.08),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                height: _height * 0.44,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          movie.title,
                          maxFontSize: 36,
                          maxLines: 1,
                          minFontSize: 28,
                          style: TextStyle(fontFamily: "ReemKufi"),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: CircularPercentIndicator(
                            radius: 25,
                            percent: movie.rating * 0.1,
                            curve: Curves.easeIn,
                            animation: true,
                            center: Text(movie.rating.toString()),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor:
                                MediaQuery.of(context).platformBrightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            backgroundColor: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      movie.release,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "ReemKufi"),
                    ),
                    Row(
                      children: [
                        Text(
                          movie.runtime,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5, right: 2),
                          height: 12,
                          width: 2,
                          color: Colors.blue.shade400,
                        ),
                        Text(
                          movie.genere,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(movie.language,
                              style: TextStyle(fontSize: 16)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.005,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Description",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: _height * 0.005,
                            ),
                            Text(
                              movie.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text("Trailer",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            ConstrainedBox(
                              constraints: BoxConstraints.tight(Size(
                                  double.infinity,
                                  MediaQuery.of(context).size.height * 0.23)),
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                          movie.trailer)
                                      .toString(),
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(_width, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DownloadResCard(
                                  res: "480", qualiy: "SD", url: movie.url480),
                              DownloadResCard(
                                  res: "720", url: movie.url720, qualiy: "HD"),
                              DownloadResCard(
                                  res: "1080",
                                  url: movie.url1080,
                                  qualiy: "Full HD"),
                            ],
                          ),
                        );
                      });
                },
                child: Center(
                    child: Text("Download",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "ReemKufi",
                        ))),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class DownloadResCard extends StatelessWidget {
  final String res;
  final String url;
  final String qualiy;

  const DownloadResCard({
    Key? key,
    required this.res,
    required this.url,
    required this.qualiy,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Colors.black26
          : Colors.white,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Container(
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${res}p",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                qualiy,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
