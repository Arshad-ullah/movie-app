import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/UI/screens/nav_bar/nav_bar_viewmodel.dart';
import 'package:movie_app/src/core/constants/images.dart';
import 'package:movie_app/src/core/extensions/media_quary.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarViewModel>(
      builder: (context, model, child) => Scaffold(
          body: model.screens[model.currentIndex],
          bottomNavigationBar: Container(
            height: context.height * 0.09,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: kBlack,
                selectedItemColor: kWhite,
                unselectedItemColor: kGrey,
                selectedFontSize: 9,
                unselectedFontSize: 9,
                currentIndex: model.currentIndex,
                onTap: (index) {
                  model.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        ImageIcon(
                          AssetImage(ImageMovie.dashBoardIcon),
                          size: 20.r,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    label: "Dashboard",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        ImageIcon(
                          AssetImage(ImageMovie.watchIcon),
                          size: 20.r,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    label: "Watch",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        ImageIcon(
                          AssetImage(ImageMovie.mediaIcon),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    label: "Media Library",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Icon(Icons.list),
                        const SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                    label: "More",
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
