import 'package:flutter/material.dart';
import 'package:splendor_player/models/song_model.dart'; // Import model của bài hát

class MiniPlayer extends StatelessWidget {
  final Song? songs;
  final bool isPlaying;
  final Function togglePlay;

  const MiniPlayer({
    Key? key,
    required this.songs,
    required this.isPlaying,
    required this.togglePlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (songs == null) {
      return SizedBox();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            songs!.coverurl,
            fit: BoxFit.cover,
            width: 50, // Định kích thước của hình ảnh ở đây
            height: 50, // Định kích thước của hình ảnh ở đây
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                songs!.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              togglePlay();
            },
          ),
        ],
      ),
    );
  }
}
