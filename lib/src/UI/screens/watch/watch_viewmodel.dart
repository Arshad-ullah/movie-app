import 'package:flutter/material.dart';
import 'package:movie_app/src/core/models/basemodel.dart';
import 'package:movie_app/src/core/models/movieModel.dart';
import 'package:movie_app/src/core/services/api_service.dart';

import '../../../core/enums/enums.dart';

class WatchViewModel extends BaseViewModal {
  // properties
  ApiService apiService = ApiService();

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;
  bool isSearch = false;
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

// constructor
  WatchViewModel() {
    upComingMovies();
  }

// fetch upcoming movies
  void upComingMovies() async {
    setState(ViewState.busy);
    _movies.clear();

    try {
      final results = await apiService.fetchUpcomingMovies();

      for (var item in results) {
        _movies.add(MovieModel(
          posterPath: item['poster_path'],
          title: item['title'],
          releaseDate: item['release_date'],
          voteCount: item['vote_count'],
          overview: item['overview'],
          movieId: item['id'],
        ));
      }
      print("------------->>>");
      print(results);

      notifyListeners();
      setState(ViewState.idle);
    } catch (e) {
      print('Failed to fetch movies');
      setState(ViewState.idle);
    }
  }

// search movie
  void searchMovie(String searchText) {
    searchQuery = searchText;
    notifyListeners();
  }

// enable search
  void enableSearch() {
    isSearch = true;
    notifyListeners();
  }

// disable search
  void disableSearch() {
    isSearch = false;
    notifyListeners();
  }
}
