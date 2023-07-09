// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/src/UI/screens/dashboard/dashboard_screen.dart';
import 'package:movie_app/src/UI/screens/media_library/media_library_screen.dart';
import 'package:movie_app/src/UI/screens/more/more_screen.dart';
import 'package:movie_app/src/UI/screens/watch/watch_screen.dart';

class BottomNavBarViewModel extends ChangeNotifier {
  final List<Widget> _screens = [
    const DashBoardScreen(),
    const WatchingScreen(),
    const MediaLibraryScreen(),
    const MoreOptionScreen(),
  ];
  List<Widget> get screens => _screens;
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
