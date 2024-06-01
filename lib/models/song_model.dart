class Song {
  // final String id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    // required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      // id: json['_id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      coverUrl: json['coverurl'],
    );
  }
}
