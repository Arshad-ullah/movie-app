// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/images.dart';

import '../../../core/constants/fontmanager.dart';
import '../../widgets/custom_back_button.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  @override
  Widget build(BuildContext context) {
    int values = 0;
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
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //container have cente image
              Container(
                height: 200.h,
                width: 400.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(ImageMovie.mapMobile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        values++;
                      });
                    },
                    child: Container(
                      height: 29.h,
                      width: 29.w,
                      decoration: BoxDecoration(
                        color: kWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Icon(Icons.add, color: kBlack, size: 20.sp)),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        values--;
                      });
                    },
                    child: Container(
                      height: 29.h,
                      width: 29.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhite,
                      ),
                      child: Center(
                          child:
                              Icon(Icons.remove, color: kBlack, size: 20.sp)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Divider(thickness: 4, color: Colors.grey[400]))),
              SizedBox(height: 10.h),
              // i want the below backround is white
            ],
          )),
      bottomNavigationBar: Container(
        height: 252.h,
        width: 400.w,
        decoration: BoxDecoration(
          color: kWhite,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(children: [
            Row(
              children: [
                CustomRow(
                  imagePath: ImageMovie.seatImage,
                  text: 'Selected',
                  color: kDarkYellow,
                ),
                SizedBox(width: 20.w),
                CustomRow(
                  imagePath: ImageMovie.seatImage,
                  text: 'Not available',
                  color: kLightGray,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                CustomRow(
                  imagePath: ImageMovie.seatImage,
                  text: 'VIP(150\$)',
                  color: kDarkBlue,
                ),
                SizedBox(width: 15.w),
                CustomRow(
                  imagePath: ImageMovie.seatImage,
                  text: 'Regular(50\$)',
                  color: kLightBlue,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40.h,
                  width: 108.w,
                  decoration: BoxDecoration(
                    color: kLightGray.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      manropeText(
                        text: "4/ 3row",
                        color: kBlack,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 10.w),
                      Icon(Icons.close, color: kBlack, size: 16.sp),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  width: 108.w,
                  decoration: BoxDecoration(
                    color: kLightGray.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      Text('Total Price'),
                      Text('\$ $values',
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
                ),
                Container(
                  height: 50.h,
                  width: 216.w,
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: manropeText(
                      text: 'Proceed to pay',
                      color: kWhite,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  CustomRow({required this.imagePath, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 17.sp,
          height: 13.sp,
          color: color,
        ),
        SizedBox(width: 10.w),
        manropeText(
          text: text,
          color: kGrey.withOpacity(0.5),
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
