import '../../model/songs/song.dart';

class SongDto {
  // static const String idKey = 'id';
  static const String titleKey = 'title';
  static const String artistidKey = 'artistId';
  static const String durationKey = 'duration';
  static const String imageurlKey = 'imageUrl'; // in ms

  static Song fromJson(Map<String, dynamic> json) {
    assert(json[titleKey] is String);
    assert(json[artistidKey] is String);
    assert(json[durationKey] is int);
    assert(json[imageurlKey] is String);

    return Song(
      title: json[titleKey],
      artistId: json[artistidKey],
      duration: Duration(milliseconds: (json[durationKey] as num).toInt()),
      imageUrl: Uri.parse(json[imageurlKey]),
         );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Song song) {
    return {
      titleKey: song.title,
      artistidKey: artistidKey,
      durationKey: song.duration.inMilliseconds,
      imageurlKey: song.imageUrl.toString(),
    };
  }
}
