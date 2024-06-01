import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splendor_player/controller/bottom_nav_controller.dart';
import 'package:splendor_player/controller/rest_api.dart';
import 'package:splendor_player/models/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:splendor_player/url.dart';
import 'package:splendor_player/widgets/widgets.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongNow extends StatefulWidget {
  const SongNow({super.key});

  @override
  State<SongNow> createState() => _SongNowState();
}

class _SongNowState extends State<SongNow> {
  final Song? songData = Get.arguments as Song?;
  AudioPlayer audioPlayer = AudioPlayer();

  // List<Song> songData = [];
  @override
  void initializeAudio() {
    if (songData != null) {
      String validUrl = '${url}${songData!.url}'.replaceAll('\\', '/').replaceAll(' ', '%20');
      audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
          children: [
            AudioSource.uri(
              Uri.parse(validUrl),
            ),
          ],
        ),
      );
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAudio();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekBarData(position, duration ?? Duration.zero);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "${url}${songData!.coverUrl}",
            fit: BoxFit.cover,
          ),
          const _BackgroundFilter(),
          // MusicPlayer(
          //   song: songData,
          //   seekBarDataStream: _seekBarDataStream,
          //   audioPlayer: audioPlayer,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${songData!.title}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${songData!.description}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<SeekBarData>(
                  stream: _seekBarDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      position: positionData?.position ?? Duration.zero,
                      duration: positionData?.duration ?? Duration.zero,
                      onChangeEnd: audioPlayer.seek,
                    );
                  },
                ),
                PlayerButton(audioPlayer: audioPlayer),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 35,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: Icon(
                        Icons.cloud_download,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0)
            ],
            stops: const [
              0.0,
              0.4,
              0.6
            ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ])),
      ),
    );
  }
}
