import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splendor_player/controller/rest_api.dart';
import 'package:splendor_player/models/song_model.dart';
import 'package:splendor_player/url.dart';

class SongCards extends StatefulWidget {
  const SongCards({
    super.key,
    required this.Width,
  });

  final double Width;

  @override
  State<SongCards> createState() => _SongCardsState();
}

class _SongCardsState extends State<SongCards> {
  List<Song> songData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API_Request.fetchSong().then((dataFromServer) {
      setState(() {
        songData = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: songData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.toNamed('/song', arguments: songData[index]);
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: widget.Width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage("${url}${songData[index].coverUrl}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: widget.Width * 0.37,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white.withOpacity(0.7)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${songData[index].title}',
                                style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple.shade800,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${songData[index].description}',
                                style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.play_circle,
                          color: Colors.deepPurple,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
