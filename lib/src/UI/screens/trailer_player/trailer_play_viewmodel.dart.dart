import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerPlayViewModel extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  bool isPlaying = false;

  TrailerPlayViewModel() {
    initializVideo();
  }

  // play video automatically

  void initializVideo() async {
    try {
      isPlaying = true;
      notifyListeners();
      videoPlayerController = VideoPlayerController.network(
          'https://firebasestorage.googleapis.com/v0/b/testdatabase-295f5.appspot.com/o/COBWEB%20Trailer%20(2023).mp4?alt=media&token=c9358117-9066-45c0-9bed-7d417725957c');

      await videoPlayerController!.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        // aspectRatio: 3 / 2,
        allowMuting: true,
        autoPlay: true,
        looping: true,

        // allowFullScreen: true,
      );
      isPlaying = false;
      notifyListeners();
    } catch (e) {
      isPlaying = false;
      notifyListeners();
      print(e.toString() + "--------------------->>");
    }
  }

// dispose video player and chewie controller
  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }
}
