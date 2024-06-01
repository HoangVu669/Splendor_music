import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:splendor_player/controller/userProvider.dart';
import 'package:splendor_player/screen/Favorite_Screen.dart';
import 'package:splendor_player/screen/Login_Screen.dart';
import 'package:splendor_player/screen/Main_Screen.dart';
import 'package:splendor_player/screen/home_screen.dart';
import 'package:splendor_player/screen/now_playing_screen.dart';
import 'package:splendor_player/screen/playlist_screen.dart';
import 'package:splendor_player/screen/profile_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: MainScreen(),
        getPages: [
          GetPage(name: '/', page: () => HomeScreen()),
          GetPage(name: '/song', page: () => SongNow()),
          GetPage(name: '/Playlist', page: () => PlayListScreen()),
          GetPage(name: '/Profile', page: () => ProfileScreen()),
          GetPage(name: '/Favorite', page: () => FavoriteScreen()),
        ],
      ),
    );
  }
}
