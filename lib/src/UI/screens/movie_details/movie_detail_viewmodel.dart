import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/UI/widgets/custom_back_button.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/models/basemodel.dart';
import 'package:movie_app/src/core/services/api_service.dart';

import '../../../core/enums/enums.dart';
import 'movie_detail_screen.dart';

class MovieDetailViewModel extends BaseViewModal {
  final int movieId;
  List color = [
    kPink,
    kDarkBlue,
    kDarkYellow,
    kLightBlue,
    kBlack,
    kGreenBlue,
    kGrey,
    kLightGray,
  ];
  ApiService apiService = ApiService();
  final List _genres = [];
  List<Widget> customWidgets = [];
  List get genres => _genres;

  MovieDetailViewModel({required this.movieId}) {
    getMovieGenres();
  }

  void getMovieGenres() async {
    setState(ViewState.busy);
    try {
      final results = await apiService.fetchMovieGenres(movieId);
      print("------------->>>");
      print(results);
      for (var item in results) {
        _genres.add(item['name']);
      }

      print(genres.toString());

      // colorSuffole
      colorSuffole();

      // customGenres
      customGenres();

      notifyListeners();

      setState(ViewState.idle);
    } catch (e) {
      print('Failed to fetch movies');
      setState(ViewState.idle);
    }
  }

  void colorSuffole() {
    color.shuffle();
    notifyListeners();
  }

  void customGenres() {
    customWidgets.clear();

    for (var i = 0; i < genres.length; i++) {
      customWidgets.add(
        CustomButton(
          color: color[i],
          text: genres[i],
          onTap: () {},
        ),
      );
      if (i < genres.length - 1) {
        customWidgets.add(SizedBox(
          width: 20.w,
        ));
      }
    }
  }
}
