class Song {
  final String title;
  final String description;
  final String url;
  final String coverurl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverurl,
  });

  static List<Song> songs = [
    Song(
      title: "EM XINH",
      description: "MONO",
      url: "assets/music/Em Xinh.mp3",
      coverurl: "assets/image/Song/em xinh.png",
    ),
    Song(
      title: "CHÚNG TA ",
      description: "SƠN TÙNG M-TP",
      url: "assets/music/CHÚNG TA CỦA TƯƠNG LAI.mp3",
      coverurl: "assets/image/Song/CHÚNG TA CỦA TƯƠNG LAI.png",
    ),
    Song(
      title: "A đến Ă",
      description: "Dương Domic",
      url: "assets/music/A ĐẾN Ă.mp3",
      coverurl: "assets/image/Song/A ĐẾN Ă.jpg",
    ),
    Song(
      title: "YÊU EM ",
      description: "Dương Domic",
      url: "assets/music/YÊU EM 2 NGÀY.mp3",
      coverurl: "assets/image/Song/YÊU EM 2 NGÀY.jpg",
    ),
  ];
}
