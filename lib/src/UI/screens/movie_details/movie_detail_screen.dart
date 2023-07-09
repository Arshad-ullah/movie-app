import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_app/src/UI/screens/trailer_player/trailer_play_screen.dart';
// import 'package:movie_app/src/UI/screens/get_ticket/get_ticket_screen.dart';
import 'package:movie_app/src/UI/widgets/customButton.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/fontmanager.dart';
import 'package:movie_app/src/core/constants/images.dart';
import 'package:movie_app/src/core/extensions/media_quary.dart';
import 'package:movie_app/src/core/models/movieModel.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/enums.dart';
import '../../widgets/custom_back_button.dart';
import '../get_ticktet/get_ticket_screen.dart';
import 'movie_detail_viewmodel.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailScreen({super.key, required this.movieModel});

  MovieModel movieModel;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.movieModel.title);
    return ChangeNotifierProvider(
      create: (context) =>
          MovieDetailViewModel(movieId: widget.movieModel.movieId),
      child: Consumer<MovieDetailViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: context.height,
                  width: context.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.02),
                        height: context.height * 0.5,
                        width: context.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${widget.movieModel.posterPath}"),
                          fit: BoxFit.cover,
                        )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: context.height * 0.02,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CustomBackButton(),
                                SizedBox(
                                  width: context.width * 0.015,
                                ),
                                manropeText(
                                  text: 'Watch',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Spacer(),
                            manropeText(
                              text:
                                  'In theaters ${widget.movieModel.releaseDate}',
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: context.height * 0.015,
                            ),
                            // TODO: get tickets button
                            CustomContainer(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        GetTicketScreen(),
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
                              containerColor: kLightBlue,
                              borderColor: kLightBlue,
                              width: 270.w,
                              widget: manropeText(
                                text: "Get Tickets",
                                color: kWhite,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
                            ),

                            // TODO: watch trailer button
                            SizedBox(
                              height: 50.h,
                              width: 265.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TrailerPlayScreen()));
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: kLightBlue,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.play_arrow,
                                      color: kWhite,
                                    ),
                                    SizedBox(
                                      width: context.width * 0.01,
                                    ),
                                    manropeText(
                                      text: "Watch Trailer",
                                      color: kWhite,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.034,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.027,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            manropeText(
                              text: "Genres",
                              color: kBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: context.height * 0.014,
                            ),

                            Wrap(
                              children: model.customWidgets,
                            ),

                            // Wrap(
                            //   children: [
                            //     CustomButton(
                            //       onTap: () {},
                            //       color: kGreenBlue,
                            //       text: "Action",
                            //     ),
                            //     SizedBox(
                            //       width: context.width * 0.02,
                            //     ),
                            //     CustomButton(
                            //       onTap: () {},
                            //       color: kPink,
                            //       text: "Thriller",
                            //     ),
                            //     SizedBox(
                            //       width: context.width * 0.02,
                            //     ),
                            //     CustomButton(
                            //       onTap: () {},
                            //       color: kDarkBlue,
                            //       text: "Science",
                            //     ),
                            //     SizedBox(
                            //       width: context.width * 0.02,
                            //     ),
                            //     CustomButton(
                            //       onTap: () {},
                            //       color: kDarkYellow,
                            //       text: "Fiction",
                            //     ),
                            //   ],
                            // ),

                            SizedBox(
                              height: context.height * 0.022,
                            ),
                            Divider(
                              color: kGrey.withOpacity(0.1),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: context.height * 0.015,
                            ),
                            manropeText(
                              text: "Overview",
                              color: kBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: context.height * 0.014,
                            ),
                            manropeText(
                              text: widget.movieModel.overview,
                              color: kGrey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      )
                    ],
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

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.text,
    this.color,
    this.onTap,
  });
  final String? text;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap ?? () {},
      containerColor: color ?? kLightBlue,
      borderColor: Colors.transparent,
      radius: 16,
      height: 30.h,
      width: 70.w,
      widget: FittedBox(
        child: manropeText(
          text: text ?? "",
          color: kWhite,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
