import 'package:flutter/material.dart';
import 'package:splendor_player/controller/rest_api.dart';
import 'package:splendor_player/models/song_model.dart';
import 'package:get/get.dart';
import 'package:splendor_player/url.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Song> songData = [];
  TextEditingController _controller = TextEditingController();

  void _searchSongs(String query) async {
    try {
      final songs = await API_Request.searchSongs(query);
      setState(() {
        songData = songs;
      });
    } catch (e) {
      print('Failed to load songs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(1.0),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: _controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey.shade400),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _searchSongs(value);
                  } else {
                    setState(() {
                      songData = [];
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(8, 1, 8, 0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/song', arguments: songData[index]);
                      },
                      child: Container(
                        height: 75,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade800.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                "${url}${songData[index].coverUrl}",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    songData[index].title,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    songData[index].description,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed('/song', arguments: songData[index]);
                                },
                                icon: Icon(
                                  Icons.play_circle,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
