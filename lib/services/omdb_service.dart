import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mark_my_movie/movie.dart';

class OmdbService {
  final String _apiKey = '25b8aaae';

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('http://www.omdbapi.com/?s=$query&apikey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final movies = (jsonResponse['Search'] as List)
          .map((movieData) => Movie.fromJson(movieData))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
