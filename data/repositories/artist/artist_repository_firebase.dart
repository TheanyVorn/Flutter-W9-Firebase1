import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/W9Firebase1/data/dtos/artist_dto.dart';
import 'package:test/W9Firebase1/model/artist/artist.dart';

import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri ArtistsUri = Uri.https(
    'w9-database-1f247-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(ArtistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> artistJson = json.decode(response.body);

      List<Artist> result = [];
      for (var iterable in artistJson.entries) {
        // String songKey = iterable.key;
        Map<String, dynamic> artistData = iterable.value;
        result.add(ArtistDto.fromJson(artistData));
      }
      return result;
    } else {
      throw Exception('Failed to fetch song: ${response.statusCode}');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) {
    // TODO: implement fetchArtistById
    throw UnimplementedError();
  }
}
