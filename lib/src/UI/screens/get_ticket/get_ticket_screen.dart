import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/UI/screens/movie_details/movie_detail_screen.dart';
import 'package:movie_app/src/UI/widgets/custom_back_button.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/fontmanager.dart';
import 'package:movie_app/src/core/constants/images.dart';

import '../select_seat/select_seat_screen.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> dates = [
      '5 Oct',
      '6 Oct',
      '7 Oct',
      '8 Oct',
      '9 Oct',
      '10 Oct',
      '11 Oct',
      '12 Oct',
    ];
    int selectValue = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 110.h,
        backgroundColor: kWhite,
        leading: CustomBackButton(),
        title: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: manropeText(
                  text: "The King’s Man",
                  color: kBlack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('In theaters december 22, 2021',
                  style: TextStyle(color: kLightBlue, fontSize: 12)),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70.h),
            Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    dates.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectValue = index;
                          });

                          log(selectValue.toString());
                          log(index.toString());
                        },
                        child: Container(
                          height: 32.h,
                          width: 67.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: selectValue == index ? kLightBlue : kWhite,
                          ),
                          child: Center(
                            child: Text(
                              dates[index],
                              style: TextStyle(
                                color: selectValue == index ? kWhite : kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      width: 250.w,
                      margin: EdgeInsets.symmetric(vertical: 60.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: '12:30',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Cinetech + hall 1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            height: 154.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                ImageMovie.mapMobile,
                                width: 144.w,
                                height: 113.w,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'From ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                TextSpan(
                                  text: '50',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                TextSpan(
                                  text: ' or ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                TextSpan(
                                  text: '2500 bonus',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectSeatScreen()));
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: kLightBlue,
                ),
                child: Center(
                    child: Text(
                  'Select Seats',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}
