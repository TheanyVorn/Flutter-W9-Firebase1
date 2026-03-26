import '../../model/artist/artist.dart';

class ArtistDto {
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageurlKey = 'imageUrl';

  static Artist fromJson(Map<String, dynamic> json) {
    assert(json[idKey] is String);
    assert(json[nameKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageurlKey] is String);

    return Artist(
      id: json[idKey],
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageurlKey]),
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      idKey: artist.id,
      nameKey: artist.name,
      genreKey: artist.genre,
      imageurlKey: artist.imageUrl.toString(),
    };
  }
}
