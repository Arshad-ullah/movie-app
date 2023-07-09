import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/fontmanager.dart';

class MoreOptionScreen extends StatefulWidget {
  const MoreOptionScreen({super.key});

  @override
  State<MoreOptionScreen> createState() => _MoreOptionScreenState();
}

class _MoreOptionScreenState extends State<MoreOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: manropeText(
      text: 'More Option',
      color: kBlack,
      fontSize: 23.h,
    )));
  }
}
