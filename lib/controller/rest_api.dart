import 'dart:convert';
import 'package:splendor_player/models/playlist_model.dart';
import 'package:splendor_player/models/song_model.dart';
import 'package:http/http.dart' as http;
import 'package:splendor_player/url.dart';

class API_Request {

  static List<Song> parseSong(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Song> songs = list.map((model) => Song.fromJson(model)).toList();
    return songs;
  }

  static List<Playlist> parsePlaylist(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Playlist> playlists = list.map((model) => Playlist.fromJson(model)).toList();
    return playlists;
  }

  static Future<List<Song>> fetchSong({int page = 1}) async{
    final response = await http.get(Uri.parse("${url}songs"));
    if(response.statusCode == 200 ){
      return parseSong(response.body);
    } else if (response.statusCode == 404 ) {
      throw Exception('not found');
    } else {
      throw Exception('can\'t get post');
    }
  }

  static Future<List<Playlist>> fetchPlaylist({int page = 1}) async {
    final response = await http.get(Uri.parse("${url}playlists"));
    if (response.statusCode == 200) {
      return parsePlaylist(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get playlists');
    }
  }

  static Future<List<Song>> searchSongs(String query) async {
    final response = await http.get(Uri.parse('${url}songs?q=$query'));
    if (response.statusCode == 200) {
      return parseSong(response.body);
    } else {
      throw Exception('Failed to load songs');
    }
  }

}