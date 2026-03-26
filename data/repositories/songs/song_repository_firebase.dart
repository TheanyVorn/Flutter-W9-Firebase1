import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'w9-database-1f247-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  //   @override
  //   Future<List<Song>> fetchSongs() async {
  //     final http.Response response = await http.get(songsUri);

  //     if (response.statusCode == 200) {
  //       // 1 - Send the retrieved list of songs
  //       List<dynamic> songJson = json.decode(response.body);
  //       return songJson.map((item) => SongDto.fromJson(item)).toList();
  //     } else {
  //       // 2- Throw expcetion if any issue
  //       throw Exception('Failed to load posts');
  //     }
  //   }

  //   @override
  //   Future<Song?> fetchSongById(String id) async {}
  // }

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (var iterable in songJson.entries) {
        // String songKey = iterable.key;
        Map<String, dynamic> songData = iterable.value;
        result.add(SongDto.fromJson(songData));
      }
      return result;
    } else {
      throw Exception('Failed to fetch song: ${response.statusCode}');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) {
    // TODO: implement fetchSongById
    throw UnimplementedError();
  }
}
