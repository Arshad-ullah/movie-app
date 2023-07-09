import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/src/core/services/api_key.dart';

class ApiService {
  String baseUrl = 'https://api.themoviedb.org/3/movie';
  fetchUpcomingMovies() async {
    String url = '$baseUrl/upcoming?api_key=$API_Key';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results'];
      } else {
        print('Failed to fetch movies');
      }
    } catch (_) {
      print('Failed to fetch movies');
    }
  }

  // fetchMovieGenres(int movieId)

  fetchMovieGenres(int movieId) async {
    try {
      String url = '$baseUrl/$movieId?api_key=$API_Key';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['genres'];
      } else {
        print('Failed to fetch movies');
      }
    } catch (e) {
      print('Failed to fetch movies');
    }
  }
}
