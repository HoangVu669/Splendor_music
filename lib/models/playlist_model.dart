import 'package:splendor_player/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Hip hop',
      songs: Song.songs,
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rap-hip-hop-youtube-thumbnail-design-template-2763cbb8d125c778126b1ed3be5264b2_screen.jpg?ts=1570880684',
    ),
    Playlist(
      title: 'Rock',
      songs: Song.songs,
      imageUrl:
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rap-hip-hop-youtube-thumbnail-design-template-2763cbb8d125c778126b1ed3be5264b2_screen.jpg?ts=1570880684',
    ),
    Playlist(
      title: 'Techno',
      songs: Song.songs,
      imageUrl:
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rap-hip-hop-youtube-thumbnail-design-template-2763cbb8d125c778126b1ed3be5264b2_screen.jpg?ts=1570880684',
    ),
  ];
}
