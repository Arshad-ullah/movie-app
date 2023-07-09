import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:movie_app/src/UI/screens/trailer_player/trailer_play_viewmodel.dart.dart';
import 'package:movie_app/src/core/constants/colors.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class TrailerPlayScreen extends StatelessWidget {
  const TrailerPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TrailerPlayViewModel(),
      child: Consumer<TrailerPlayViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: kBlack,
          appBar: AppBar(
            backgroundColor: kBlack,
            leading: IconButton(
              onPressed: () {
                model.videoPlayerController!.pause();
                Get.back();
              },
              icon: Icon(
                Icons.clear,
                color: kWhite,
              ),
            ),
          ),
          body: model.isPlaying
              ? Center(
                  child: CircularProgressIndicator(
                    color: kWhite,
                  ),
                )
              : SafeArea(
                  child: Container(
                    height: context.height,
                    width: context.width,
                    color: kBlack,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.9,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio:
                              model.videoPlayerController!.value.aspectRatio,
                          child: Chewie(
                            controller: model.chewieController!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
