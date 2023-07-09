import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/src/UI/screens/movie_details/movie_detail_screen.dart';
import 'package:movie_app/src/UI/screens/watch/watch_viewmodel.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/fontmanager.dart';
import 'package:movie_app/src/core/extensions/media_quary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/enums.dart';

class WatchingScreen extends StatefulWidget {
  const WatchingScreen({super.key});

  @override
  State<WatchingScreen> createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WatchViewModel(),
      child: Consumer<WatchViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          color: kBlack,
          child: Scaffold(
              body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
              height: context.height,
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  model.isSearch
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.02),
                            child: TextFormField(
                              controller: model.searchController,
                              onChanged: (value) {
                                model.searchMovie(value);
                              },
                              decoration: InputDecoration(
                                  hintText: 'TV shows, movies and more',
                                  hintStyle: GoogleFonts.manrope(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  fillColor: kLightGray,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      model.searchController.clear();
                                      model.disableSearch();
                                    },
                                    icon: Icon(Icons.clear,
                                        color: Colors.black, size: 30.sp),
                                  )),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            manropeText(
                              text: 'Watch',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            IconButton(
                                onPressed: () {
                                  model.enableSearch();
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  const Divider(
                    color: kLightGray,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.movies.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = model.movies[index];

                        if (model.searchQuery.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        MovieDetailScreen(
                                      movieModel: model.movies[index],
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.easeInOutCubic;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Image.network(
                                    //   model.searchRecipe[index].imageUrl!,
                                    //   fit: BoxFit.cover,
                                    //   height: 200,
                                    //   width: double.infinity,
                                    // ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/w500/${model.movies[index].posterPath}",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 200,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                      placeholder: (context, url) => Container(
                                        height: 200,
                                        width: 400,
                                        color: Colors.grey,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 200,
                                        width: 400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black,
                                            ],
                                          ).createShader(bounds);
                                        },
                                        blendMode: BlendMode.dstIn,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.width * 0.023),
                                          alignment: Alignment.centerLeft,
                                          height: 50,
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(0.8),
                                          child: Text(
                                            "${model.movies[index].title}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (data.title!
                            .toLowerCase()
                            .toString()
                            .contains(
                                model.searchQuery.toLowerCase().toString())) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        MovieDetailScreen(
                                      movieModel: model.movies[index],
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.easeInOutCubic;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Image.network(
                                    //   model.searchRecipe[index].imageUrl!,
                                    //   fit: BoxFit.cover,
                                    //   height: 200,
                                    //   width: double.infinity,
                                    // ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/w500/${model.movies[index].posterPath}",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 200,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                      placeholder: (context, url) => Container(
                                        height: 200,
                                        width: 400,
                                        color: Colors.grey,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 200,
                                        width: 400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black,
                                            ],
                                          ).createShader(bounds);
                                        },
                                        blendMode: BlendMode.dstIn,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.width * 0.023),
                                          alignment: Alignment.centerLeft,
                                          height: 50,
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(0.8),
                                          child: Text(
                                            "${model.movies[index].title}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
