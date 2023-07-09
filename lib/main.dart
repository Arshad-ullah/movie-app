import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/UI/screens/nav_bar/nav_bar_screen.dart';
import 'package:movie_app/src/UI/screens/splash/splash_screen.dart';
import 'package:movie_app/src/core/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
