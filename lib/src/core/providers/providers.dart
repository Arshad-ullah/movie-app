import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../UI/screens/movie_details/movie_detail_viewmodel.dart';
import '../../UI/screens/nav_bar/nav_bar_viewmodel.dart';
import '../../UI/screens/watch/watch_viewmodel.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => BottomNavBarViewModel()),
  // ChangeNotifierProvider(create: (context) => MovieDetailViewModel()),
];
