import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:splendor_player/controller/rest_api.dart';
import 'package:splendor_player/screen/Main_Screen.dart';
import 'dart:io';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String songPath = '';
  String coverPath = '';

  void pickSong() async {
    try {
      String path = await API_Request.pickFile();
      setState(() {
        songPath = path;
      });
    } catch (e) {
      print('Error picking song: $e');
    }
  }

  void pickCover() async {
    try {
      String path = await API_Request.pickFile();
      setState(() {
        coverPath = path;
      });
    } catch (e) {
      print('Error picking cover: $e');
    }
  }

  void uploadSong() async {
    try {
      await API_Request.uploadSong(
        title: titleController.text,
        description: descriptionController.text,
        songPath: songPath,
        coverPath: coverPath,
      );
      print('Uploaded successfully');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } catch (e) {
      print('Error uploading: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Song'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  style: TextStyle(color: Colors.black),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  style: TextStyle(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: pickSong,
                  child: Text('Pick Song'),
                ),
                Text(
                  songPath.isNotEmpty ? songPath : 'No song selected',
                  style: TextStyle(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: pickCover,
                  child: Text('Pick Cover'),
                ),
                Text(
                  coverPath.isNotEmpty ? coverPath : 'No cover selected',
                  style: TextStyle(color: Colors.black),
                ),
                if (coverPath.isNotEmpty)
                  Image.file(
                    File(coverPath),
                    height: 200,
                    width: 200,
                    fit: BoxFit.fitHeight,
                  ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (songPath.isNotEmpty && coverPath.isNotEmpty) {
                      uploadSong();
                    } else {
                      print('Please select both song and cover files');
                    }
                  },
                  child: Text('Upload'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
