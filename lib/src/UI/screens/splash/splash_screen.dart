import 'package:flutter/material.dart';
import 'package:movie_app/src/UI/screens/nav_bar/nav_bar_screen.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/extensions/media_quary.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/fontmanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavbarScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        color: kBlack,
        child: Center(
            child: manropeText(
          text: 'Movie App',
          color: kWhite,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
        )),
      ),
    );
  }
}
