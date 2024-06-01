import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splendor_player/controller/bottom_nav_controller.dart';
import 'package:splendor_player/controller/rest_api.dart';
import 'package:splendor_player/models/playlist_model.dart';
import 'package:splendor_player/models/song_model.dart';
import 'package:get/get.dart';
import 'package:splendor_player/url.dart';
import 'package:splendor_player/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Song> songData = [];
  List<Playlist> playlistData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API_Request.fetchSong().then((dataFromServer) {
      setState(() {
        songData = dataFromServer;
      });
    });

    API_Request.fetchPlaylist().then((dataFromServer) {
      setState(() {
        playlistData = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.find();
    double Heigh = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade800.withOpacity(1.0),
                Colors.deepPurple.shade200.withOpacity(0.8)
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _CustomAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _DiscoveryMusic(),
              _TrendingMusic(Heigh: Heigh, songs: songData, Width: Width),
              _PlaylistMusic(playlists: playlistData),
          // MiniPlayer(
          //   songs: song,
          //   isPlaying: _isPlaying,
          //   togglePlay: () {
          //     setState(() {
          //       _isPlaying = !_isPlaying;
          //       // Thêm logic điều khiển phát nhạc ở đây
          //     });
          //   },
          // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SectionHeader(title: "Playlists"),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20),
            physics: NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlists: playlists[index]);
            },
          )
        ],
      ),
    );
  }
}


class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.Heigh,
    required this.songs,
    required this.Width,
  });

  final double Heigh;
  final List<Song> songs;
  final double Width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SectionHeader(title: 'Trending Music'),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: Heigh * 0.27,
            child: SongCards(Width: 1 * Width)
          ),
        ],
      ),
    );
  }
}

class _DiscoveryMusic extends StatelessWidget {
  const _DiscoveryMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 5,
          ),
          Text(
            'Enjoy your favourite music',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Container()
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/image/user-default.3ff115bb.png"),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}

