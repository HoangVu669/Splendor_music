import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splendor_player/screen/Favorite_Screen.dart';
import 'package:splendor_player/screen/Login_Screen.dart';
import 'package:splendor_player/screen/Main_Screen.dart';
import 'package:splendor_player/screen/home_screen.dart';
import 'package:splendor_player/screen/now_playing_screen.dart';
import 'package:splendor_player/screen/playlist_screen.dart';
import 'package:splendor_player/screen/profile_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white
          )
      ),
      home: MainScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongNow()),
        GetPage(name: '/Playlist', page: () => const PlayListScreen()),
        // GetPage(name: '/Login', page: () => const LoginScreen()),
        GetPage(name: '/Profile', page: () => const ProfileScreen()),
        GetPage(name: '/Favorite', page: () => const FavoriteScreen()),
      ],
    );
  }
}
