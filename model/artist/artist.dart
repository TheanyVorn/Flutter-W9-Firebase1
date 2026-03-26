class Artist {
  final int id;
  final String name;
  final String genre;
  Uri imageUrl;

  Artist({
    required this.id,
    required this.name,
    required this.genre,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Song(artist: $name, songGenre: $genre, imageUrl: $imageUrl)';
  }
}
